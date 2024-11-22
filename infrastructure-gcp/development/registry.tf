  resource "google_artifact_registry_repository" "imabulary-dev-repo" {
    location = "us-central1"
    repository_id = "imabulary-dev"
    description = "Repository for Storing Development Images for imabulary project"
    format = "DOCKER"
    cleanup_policy_dry_run = false
    cleanup_policies {
        id     = "keep-latest-5-versions"
        action = "KEEP"
        most_recent_versions {
            package_name_prefixes = ["v"] # Matches images with tags like "v1.0.0", "v2.3.4"
            keep_count            = 5    # Keeps the last 5 versions
            }
        }

    cleanup_policies {
    id     = "delete-old-versions"
    action = "DELETE"
    condition {
        tag_state             = "TAGGED"
        tag_prefixes          = ["v"]
        older_than            = "0s" # Ensures any version older than the latest 5 is deleted
     }   
    }
  }