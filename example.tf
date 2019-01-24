provider "google" {
  credentials = "${file("${var.credentials_file}")}"
  project     = "${var.project}"
  region      = "${var.region}"
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
}
