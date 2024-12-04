  resource "google_artifact_registry_repository" "imabulary-prod-repo" {
    location = "us-central1"
    repository_id = "imabulary-prod"
    description = "Repository for Storing Production Images for imabulary project"
    format = "DOCKER"
    cleanup_policy_dry_run = false
    cleanup_policies {
        id     = "keep-latest-5-versions"
        action = "KEEP"
        most_recent_versions {
            keep_count            = 5    # Keeps the last 5 versions
            }
        }

    cleanup_policies {
    id     = "delete-old-versions"
    action = "DELETE"
    condition {
        tag_state             = "ANY"
        older_than            = "0s" # Ensures any version older than the latest 5 is deleted
     }   
    }
  }