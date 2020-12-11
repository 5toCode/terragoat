resource "google_storage_bucket" "terragoat_website" {
  name          = "terragot-${var.environment}"
  force_destroy = true
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}

resource "google_storage_bucket" "internal_storage" {
  name          = "terragoat-internal"
  force_destroy = true
  uniform_bucket_level_access {
    bucket_policy_only = true
  }
}

resource "google_storage_bucket" "internal_storage2" {
  name          = "terragoat-internal2"
  force_destroy = true
  uniform_bucket_level_access {
    bucket_policy_only = true
  }
  encryption {
    default_kms_key_name = true
  }
}
