## Como criar sua aplicação instrumentada com OpenTelemetry para Elastic

```hcl
1. Crie um arquivo Terraform no seu ambiente:
module "my_app" {
  source                 = "../../modules/container-app"
  app_name               = "sua-app"
  resource_group         = "seu-rg"
  environment_id         = "ID do ambiente ACA"
  image                  = "sua-imagem:tag"
  otel_exporter_endpoint = "https://elastic.exemplo.com:4317"
}

2. (Opcional) Criar um backend pro state

az group create --name tf-lab-rg --location eastus

az storage account create \
  --name tfstatelab \
  --resource-group tf-lab-rg \
  --location eastus \
  --sku Standard_LRS

az storage container create \
  --name tfstate \
  --account-name tfstatelab

--- Crie um backend.tf no projeto

terraform {
  backend "azurerm" {
    resource_group_name  = "tf-lab-rg"
    storage_account_name = "tfstatelab"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
 
