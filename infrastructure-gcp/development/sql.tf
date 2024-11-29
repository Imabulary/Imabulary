data "google_secret_manager_secret_version" "postgres_password" {
 secret   = "postgres-details-password"
}
data "google_secret_manager_secret_version" "db-name" {
 secret   = "postgres-details-db-name"
}
resource "google_sql_database" "dev-db" {
  name     = data.google_secret_manager_secret_version.db-name.secret_data
  instance = google_sql_database_instance.dev-db.name
}

resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta
  name          = "db-priv-ip"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  network       = module.vpc.network_id
  prefix_length = 24
}

resource "google_service_networking_connection" "db-priv-conn" {
  provider = google-beta
  network                 = module.vpc.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}
resource "google_sql_database_instance" "dev-db" {
  name             = "imabulary-dev-priv-db"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  
  settings {
    
    availability_type = "ZONAL"
    tier = "db-custom-2-8192"
    edition = "ENTERPRISE"
    
    ip_configuration {
      ipv4_enabled    = "false"
      private_network = module.vpc.network_self_link
      ssl_mode = "ENCRYPTED_ONLY"
    }
    backup_configuration {
      enabled = true
      location = "us-central1"
      point_in_time_recovery_enabled = false
      backup_retention_settings {
        retained_backups = 3
      }
    }
  }
  # set `deletion_protection` to true, will ensure that one cannot accidentally delete this instance by
  # use of Terraform whereas `deletion_protection_enabled` flag protects this instance at the GCP level.
  deletion_protection = false
  depends_on = [google_service_networking_connection.db-priv-conn]
      lifecycle {
    ignore_changes = [
      # Ignore changes to the 'tags' attribute
      settings[0].disk_size,
      settings[0].disk_autoresize
      ]
    }
}

resource "google_sql_user" "users" {
  name     = "svc_app"
  instance = google_sql_database_instance.dev-db.name
  password = data.google_secret_manager_secret_version.postgres_password.secret_data
}