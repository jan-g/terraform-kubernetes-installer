# Output the private and public IPs of the instance

output "ids" {
  value = ["${oci_core_instance.TFInstanceDockerRegistry.id}"]
}

output "hostname_label" {
  value = "${oci_core_instance.TFInstanceDockerRegistry.hostname_label}"
}

output "private_ip" {
  value = "${oci_core_instance.TFInstanceDockerRegistry.private_ip}"
}

output "instance_public_ip" {
  value = "${oci_core_instance.TFInstanceDockerRegistry.public_ip}"
}
 