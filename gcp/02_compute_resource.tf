resource "google_compute_instance" "default" {
	name = "${var.name}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	tags = ["${var.name}"]
	boot_disk {
		initialize_params {
			image = "${var.image}"
		}
	}
	network_interface {
		network = "${var.network}"
		access_config {
			// Ephemeral IP
		}
	}
	metadata = {
    	sshKeys = "${var.ssh_user}:${file("${var.public_key}")}"
  	}	
	connection {
		type = "ssh"
		user = "${var.ssh_user}"
    host = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
		private_key = "${file("${var.private_key}")}"
	}
	provisioner "remote-exec" {
		inline = [
			"${var.update_packages[var.package_manager]}",
			"${var.install_packages[var.package_manager]} ${join(" ", var.packages)}"
		]
	}
	provisioner "remote-exec" {
		scripts = "${var.scripts}"
	}
}
