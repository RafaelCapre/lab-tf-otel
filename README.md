## Como criar sua aplicação instrumentada com OpenTelemetry para Elastic

1. Crie um arquivo Terraform no seu ambiente:
```hcl
module "my_app" {
  source                 = "../../modules/container-app"
  app_name               = "sua-app"
  resource_group         = "seu-rg"
  environment_id         = "ID do ambiente ACA"
  image                  = "sua-imagem:tag"
  otel_exporter_endpoint = "https://elastic.exemplo.com:4317"
}

