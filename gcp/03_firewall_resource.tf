resource "google_compute_firewall" "default" {
	name = "${var.name}-firewall"
	network = "${var.network}"
	target_tags = ["${var.name}"]
	source_ranges = ["0.0.0.0/0"]

	allow {
		protocol = "icmp"
	}

	allow {
		protocol = "tcp"
		ports = "${var.allowed_ports}"	
	}	
}

