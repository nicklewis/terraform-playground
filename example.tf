provider "google" {
  credentials = "${file("account.json")}"
  project     = "bolt-229621"
  region      = "us-west1"
}

