
resource "google_dns_managed_zone" "gcr-io-private-zone" {
  name        = "gcr-io-private-zone"
  dns_name    = "gcr.io."
  description = "gcr-io-private-zone"


  visibility = "private"


  private_visibility_config {
    networks {
      network_url = var.network_id
    }
  }

}

resource "google_dns_managed_zone" "pkg-dev-private-zone" {
  name        = "pkg-dev-private-zone"
  dns_name    = "pkg.dev."
  description = "pkg-dev-private-zone"


  visibility = "private"


  private_visibility_config {
    networks {
      network_url = var.network_id
    }
  }

}

resource "google_dns_managed_zone" "googleapi-private-zone" {
  name        = "googleapi-private-zone"
  dns_name    = "googleapis.com."
  description = "googleapi-private-zone"


  visibility = "private"


  private_visibility_config {
    networks {
      network_url = var.network_id
    }
  }

}

resource "google_dns_record_set" "gcr-io-record-set-A" {
  name = "gcr.io."
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.gcr-io-private-zone.name

  rrdatas = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
}

resource "google_dns_record_set" "gcr-io-record-set-cname" {
  name = "*.gcr.io."
  type = "CNAME"
  ttl  = 300

  managed_zone = google_dns_managed_zone.gcr-io-private-zone.name

  rrdatas = ["gcr.io."]
}

resource "google_dns_record_set" "pkg-dev-record-set-A" {
  name = "pkg.dev."
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.pkg-dev-private-zone.name

  rrdatas = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
}

resource "google_dns_record_set" "pkg-dev-record-set-cname" {
  name = "*.pkg.dev."
  type = "CNAME"
  ttl  = 300

  managed_zone = google_dns_managed_zone.pkg-dev-private-zone.name

  rrdatas = ["pkg.dev."]
}

resource "google_dns_record_set" "google-apis-record-set-A" {
  name = "restricted.googleapis.com."
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.googleapi-private-zone.name

  rrdatas = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
}

resource "google_dns_record_set" "google-apis-record-set-cname" {
  name = "*.googleapis.com."
  type = "CNAME"
  ttl  = 300

  managed_zone = google_dns_managed_zone.googleapi-private-zone.name

  rrdatas = ["restricted.googleapis.com."]
}