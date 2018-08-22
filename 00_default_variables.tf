variable "name" {
	default = "default"
}

variable "machine_type" {
	default = "f1-micro"
}

variable "zone" {
	default = "europe-west2-c"
}

variable "image" {
	default = "centos-7"
}

variable "network" {
	default = "default"
}

variable "ssh_user" {
	default = "terraform"
}

variable "public_key" {
	default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
	default = "~/.ssh/id_rsa"
}

variable "scripts" {
	default = []
}

