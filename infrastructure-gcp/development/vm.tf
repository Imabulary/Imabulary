# Service Account for the VM
resource "google_service_account" "artifact_registry_sa" {
  account_id   = "vm-artifact-registry-pull-sa"
  display_name = "Service Account for pulling Images from Google Artifact Registry"
}

# IAM Binding to give pull permissions for Google Artifact Registry
resource "google_artifact_registry_repository_iam_member" "artifact_registry_pull" {
  project    = var.project-id
  location   = "us-central1"
  repository = google_artifact_registry_repository.imabulary-dev-repo.name
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${google_service_account.artifact_registry_sa.email}"
  depends_on = [ google_artifact_registry_repository.imabulary-dev-repo ]
}

# VM Instance
resource "google_compute_instance" "docker_vm" {
  name         = "docker-vm"
  machine_type = "e2-standard-2"
  zone         = "us-central1-c"
  network_interface {
    network = module.vpc.network_name
    subnetwork = module.vpc.subnets["us-central1/vm-subnet"].id
    access_config {}
  }

  # Boot disk with Ubuntu
  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20241119"
    }
  }

  # Service Account for VM
  service_account {
    email  = google_service_account.artifact_registry_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  
  metadata = {
    startup-script = <<-EOT
      sudo apt update
      sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
      sudo apt update
      sudo apt install -y docker-ce docker-ce-cli containerd.io
      sudo usermod -aG docker $USER
      sudo apt install -y postgresql-common
      sudo install -d /usr/share/postgresql-common/pgdg
      sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
      # Create the repository configuration file:
      sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
      # Update the package lists:
      sudo apt update
      sudo apt install postgresql-client-15 -y
    EOT
  }

  # Metadata for Startup Script
  depends_on = [
    google_artifact_registry_repository_iam_member.artifact_registry_pull,
  ]
}
resource "google_project_iam_member" "secret-vm-access" {
  project = var.project-id
  role    = "roles/secretmanager.secretAccessor"
  member = "serviceAccount:${google_service_account.artifact_registry_sa.email}"

}
