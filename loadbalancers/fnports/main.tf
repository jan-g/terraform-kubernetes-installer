resource "oci_load_balancer_backendset" "lb-k8sworker-fn" {
  name             = "fn"
  load_balancer_id = "${var.lb_id}"
  policy           = "ROUND_ROBIN"

  health_checker {
    port                = "${var.back_end_port}"
    protocol            = "HTTP"
    response_body_regex = ".*"
    url_path            = "${var.ping_url}"
  }
}

resource "oci_load_balancer_listener" "listener-fn" {
  load_balancer_id         = "${var.lb_id}"
  name                     = "fn"
  default_backend_set_name = "${oci_load_balancer_backendset.lb-k8sworker-fn.id}"
  port                     = "${var.front_end_port}"
  protocol                 = "TCP"
}

resource "oci_load_balancer_backend" "k8sworker-backends-ad1" {
  load_balancer_id = "${var.lb_id}"
  backendset_name  = "${oci_load_balancer_backendset.lb-k8sworker-fn.name}"
  count            = "${var.ad1Count}"
  ip_address       = "${element(var.k8sworker_ad1_private_ips, count.index)}"
  port             = "${var.back_end_port}"
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

resource "oci_load_balancer_backend" "k8sworker-backends-ad2" {
  load_balancer_id = "${var.lb_id}"
  backendset_name  = "${oci_load_balancer_backendset.lb-k8sworker-fn.name}"
  count            = "${var.ad2Count}"
  ip_address       = "${element(var.k8sworker_ad2_private_ips, count.index)}"
  port             = "${var.back_end_port}"
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

resource "oci_load_balancer_backend" "k8sworker-backends-ad3" {
  load_balancer_id = "${var.lb_id}"
  backendset_name  = "${oci_load_balancer_backendset.lb-k8sworker-fn.name}"
  count            = "${var.ad3Count}"
  ip_address       = "${element(var.k8sworker_ad3_private_ips, count.index)}"
  port             = "${var.back_end_port}"
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}
