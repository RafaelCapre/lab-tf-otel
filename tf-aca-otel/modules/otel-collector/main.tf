resource "azurerm_container_app" "otel_collector" {
  name                = "otel-collector"
  resource_group_name = var.resource_group
  container_app_environment_id = var.environment_id
  revision_mode       = "Single"

  template {
    container {
      name  = "otel-collector"
      image = "otel/opentelemetry-collector:latest"
      cpu   = "0.5"
      memory = "1.0Gi"

      env {
        name  = "OTEL_EXPORTER_OTLP_ENDPOINT"
        value = "https://api.applicationinsights.azure.com/v2/track"
      }
    }
  }
}

