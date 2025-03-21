module "otel_collector" {
  source = "../../modules/otel-collector"
  resource_group = "my-resource-group"
  environment_id = azurerm_container_app_environment.my-env.id
}

module "my_app" {
  source = "../../modules/container-app"
  app_name = "my-java-app"
  resource_group = "my-resource-group"
  environment_id = azurerm_container_app_environment.my-env.id
  image = "myregistry.azurecr.io/my-java-app:latest"
  otel_collector_endpoint = module.otel_collector.otel_endpoint
}

