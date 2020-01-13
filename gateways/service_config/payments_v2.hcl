service {
  name = "payments"
  id = "payments-v2"
  address = "10.6.0.3"
  port = 9090

  tags      = ["v2"]
  meta      = {
    version = "2"
  }

  connect {
    sidecar_service {
      port = 20000

      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.6.0.3:20000"
        interval ="10s"
      }
    }
  }
}
