# Outputs

output "load_balancer_id" {
  value = "${var.lb_id}"
}

output "backendset_name" {
  value = "${oci_load_balancer_backendset.lb-k8sworker-fn.name}"
}
