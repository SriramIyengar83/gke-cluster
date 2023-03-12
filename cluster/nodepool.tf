resource "google_container_node_pool" "node_pool" {
  depends_on = [
    module.vpc
  ]
  name       = var.node_pool_name
  project    = var.project_id
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = var.machine_type
    service_account = var.service_account
    disk_type = var.disk_type
    disk_size_gb = var.disk_size_gb
    tags = var.tags
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}