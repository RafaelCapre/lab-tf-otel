output "otel_endpoint" {
  value = "http://${azurerm_container_app.otel_collector.name}:4317"
}

