variable "location" {
  description = "Região onde os recursos serão criados na Azure"
  type        = string
  default     = "East US"
}

variable "account_tier" {
  description = "Tier da conta de armazenamento"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação da conta de armazenamento"
  type        = string
  default     = "LRS"
}

variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
  default     = "example-resources"
}

variable "storage_account_name" {
  description = "Nome da conta de armazenamento"
  type        = string
  default     = "nuccigterraformstorage"
}

variable "container_name" {
  description = "Nome do contêiner de armazenamento"
  type        = string
  default     = "example-container"
}