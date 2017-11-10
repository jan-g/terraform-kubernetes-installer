variable "compartment_ocid" {}

variable "ad1Count" {}

variable "ad2Count" {}

variable "ad3Count" {}

variable "lb_id" {}

variable "front_end_port" {}

variable "back_end_port" {}

variable "ping_url" {
  default = "/"
}

variable "k8sworker_ad1_private_ips" {
  type    = "list"
  default = []
}

variable "k8sworker_ad2_private_ips" {
  type    = "list"
  default = []
}

variable "k8sworker_ad3_private_ips" {
  type    = "list"
  default = []
}
