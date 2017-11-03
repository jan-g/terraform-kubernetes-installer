/**
 * The instances/etcd module provisions and configures one or more etcd instances.
 */

resource "oci_core_instance" "TFInstanceDockerRegistry" {
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.label_prefix}${var.display_name}"
  hostname_label      = "${var.hostname_label}"
  image               = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
  shape               = "${var.shape}"
  subnet_id           = "${var.subnet_id}"

  extended_metadata {
    roles               = "registry"
    ssh_authorized_keys = "${var.ssh_public_key_openssh}"
    user_data           = "${base64encode(data.template_file.docker-registry-bootstrap.rendered)}"
    tags = "group:registry"
  }

  timeouts {
    create = "60m"
  }

  provisioner "local-exec" {
    command = "sleep 10"
  }
}
