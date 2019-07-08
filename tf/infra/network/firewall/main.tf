# VPC firewall configuration
# Create a firewall rule that allows internal communication across all protocols:
resource "google_compute_firewall" "firewalli-int" {
  name    = "${terraform.workspace}-firewall-int"
  network = "${var.vpc_name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = ["${var.ip_cidr_range}"]
}

# Create a firewall rule that allows external SSH, ICMP, and HTTPS:
resource "google_compute_firewall" "firewalli-ext" {
  name    = "${terraform.workspace}-firewall-ext"
  network = "${var.vpc_name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Create a firewall rule that allows tcp ingress on port 30080 (nodePort for kweightly app)
resource "google_compute_firewall" "kweightly-nodeport-ingress" {
  name    = "${terraform.workspace}-kweightly-nodeport-ingress"
  network = "${var.vpc_name}"

  allow {
    protocol = "tcp"
    ports    = ["30080"]
  }

  source_ranges = ["0.0.0.0/0"]
}
