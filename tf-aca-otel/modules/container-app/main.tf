resource "azurerm_container_app" "this" {
  name                = var.app_name
  resource_group_name = var.resource_group
  container_app_environment_id = var.environment_id
  revision_mode       = "Single"

  template {
    container {
      name  = var.app_name
      image = var.image
      cpu   = var.cpu
      memory = var.memory

      env {
        name  = "OTEL_SERVICE_NAME"
        value = var.app_name
      }

      env {
        name  = "OTEL_EXPORTER_OTLP_ENDPOINT"
        value = var.otel_exporter_endpoint
      }

      env {
        name  = "OTEL_RESOURCE_ATTRIBUTES"
        value = "service.name=${var.app_name},cloud.provider=azure"
      }
    }
  }
}

