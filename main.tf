
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {

  project = var.project_id
  region  = var.region
  zone    = "${var.region}-${var.zone}"
}

resource "google_compute_network" "vpc_network" {
  count = var.qty
  name = "${var.email_id}-${count.index + 1}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  count         = var.qty
  name          = "${var.email_id}-${count.index + 1}-subnet1"
  ip_cidr_range = "10.${count.index + 1}.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network[count.index].name
}

resource "google_compute_instance" "default" {
  count        = var.qty
  name         = "${google_compute_subnetwork.subnet1[count.index].name}-vm-${count.index + 1}"
  machine_type = var.machine_type

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = google_compute_network.vpc_network[count.index].name
    subnetwork = google_compute_subnetwork.subnet1[count.index].name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "echo hi > /test.txt"
}
