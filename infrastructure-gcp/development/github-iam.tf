resource "google_service_account" "gha_service_account" {
  account_id   = "github-oidc-push-image-gcr"
  display_name = "Github OIDC Service Account"
  description = "Used by GHA to push Images to Artifact Registry"
  create_ignore_already_exists = true
}

resource "google_project_iam_member" "gcr-push-policy" {
  project = var.project-id
  role    = "roles/artifactregistry.createOnPushWriter"
  member = "serviceAccount:${google_service_account.gha_service_account.email}"
  depends_on = [ google_service_account.gha_service_account ]
}


resource "google_iam_workload_identity_pool" "dev-pool" {
  workload_identity_pool_id = "imabulary-dev-pool"
  display_name              = "imabulary-dev-pool"
  description               = "Identity pool for Imabulary Dev GHA"
  disabled                  = false
}


resource "google_iam_workload_identity_pool_provider" "gha-dev-oidc" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.dev-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-dev-oidc-provider"
  display_name                       = "Dev Github Actions OIDC"
  description                        = "GitHub Actions identity pool provider for automated build and push"
  disabled                           = false
  attribute_condition = <<EOT
    assertion.repository_owner_id == "170342349" &&
    attribute.repository == "Imabulary/Imabulary" &&
    assertion.repository_owner == 'Imabulary'
EOT
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_project_iam_binding" "sa-impersonate" {
  project = var.project-id
  role    = "roles/iam.workloadIdentityUser"
  members = [
    "principalSet://iam.googleapis.com/projects/461121489085/locations/global/workloadIdentityPools/imabulary-dev-pool/attribute.repository/Imabulary/Imabulary"
  ]
}
resource "google_project_iam_member" "secret-access" {
  project = var.project-id
  role    = "roles/secretmanager.secretAccessor"
  member = "serviceAccount:${google_service_account.gha_service_account.email}"
#  condition {
#    title = "Control access to specific secrets only"
#    description = "Control access to specific secrets only"
#    expression = "resource.name.startsWith('projects/461121489085/test')   || resource.name.startsWith('projects/461121489085/admin-creds-json') || resource.name.startsWith('projects/461121489085/sa-creds-jsson') || resource.name.startsWith('projects/461121489085/env-file-dev') " 
#  }
}