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
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}
