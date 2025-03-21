variable "app_name" {}
variable "resource_group" {}
variable "environment_id" {}
variable "image" {}
variable "cpu" { default = "0.5" }
variable "memory" { default = "1.0Gi" }
variable "otel_exporter_endpoint" {}  # <- Endpoint do Elastic aqui

