resource "google_compute_instance" "default" {
	name = "${var.name}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
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
	metadata {
    	sshKeys = "${var.ssh_user}:${file("${var.public_key}")}"
  	}	
	provisioner "remote-exec" {
		connection = {
			type = "ssh"
			user = "${var.ssh_user}"
			private_key = "${file("${var.private_key}")}"
		}
		inline = [
			"${lookup(var.update_packages, var.package_manager)}",
			"${lookup(var.install_packages, var.package_manager)} ${join(" ", var.packages)}"
		]
	}
	provisioner "remote-exec" {
		connection = {
			type = "ssh"
			user = "${var.ssh_user}"
			private_key = "${file("${var.private_key}")}"
		}
		scripts = "${var.scripts}"
	}
}
