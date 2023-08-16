variable project_id {
  type        = string
  default     = "shared-project-1-392805"
  description = "description"
}

variable region {
  type        = string
  default     = "us-central1"
  description = "region"
}

variable zone {
  type        = string
  default     = "b"
  description = "Zone Name"
}

variable qty {
  type        = number
  description = "number of vpc"
default = 1
}

variable email_id {
  type        = string
  description = "number of vpc"
default = "ad"
}

variable machine_type {
  type        = string
  description = "number of vpc"
  default     = "e2-micro"
}

