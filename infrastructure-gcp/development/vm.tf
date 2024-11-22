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

  # Metadata for Startup Script
  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io
    usermod -aG docker $USER
  EOT
  depends_on = [
    google_artifact_registry_repository_iam_member.artifact_registry_pull,
  ]
}