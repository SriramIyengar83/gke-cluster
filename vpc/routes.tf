resource "google_compute_route" "default" {
  name        = "restricted-google-apis"
  dest_range  = "199.36.153.4/30"
  network     = google_compute_network.vpc_network.id
  next_hop_gateway = "default-internet-gateway"
  priority    = 1000
}