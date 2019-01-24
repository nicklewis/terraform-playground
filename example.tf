provider "google" {
  credentials = "${file("account.json")}"
  project     = "bolt-229621"
  region      = "us-west1"
}

resource "google_compute_instance" "example" {
  name = "nlew-test-instance"
  machine_type = "f1-micro"
  zone = "us-west1-a"
  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-7"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }

  provisioner "local-exec" {
    command = "echo ${google_compute_instance.example.network_interface.0.access_config.0.nat_ip} > ip_address.txt"
  }
}
