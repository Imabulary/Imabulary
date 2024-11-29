# resource "google_storage_bucket" "dev-bucket" {
#   name     = "imabulary-dev-storage-bucket"
#   location = "US"

#   force_destroy               = false
#   public_access_prevention    = "enforced"
#   uniform_bucket_level_access = true

#   versioning {
#     enabled = true
#   }
# }