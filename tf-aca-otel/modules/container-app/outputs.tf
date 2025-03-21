output "app_url" {
  value = "https://${azurerm_container_app.this.name}.azurecontainerapps.io"
}

