variable "availability_domain" {}
variable "compartment_ocid" {}
variable "display_name" {}
variable "hostname_label" {}

variable "shape" {
  default = "VM.Standard1.2"
}

variable "subnet_id" {}
variable "ssh_public_key_openssh" {}
variable "domain_name" {}

variable "label_prefix" {
  default = ""
}

variable "docker_ver" {
  default = "17.03.1.ce"
}

variable "oracle_linux_image_name" {
  default = "Oracle-Linux-7.4-2017.10.25-0"
}

variable "tenancy_ocid" {}
