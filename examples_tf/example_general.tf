terraform {
#   Configurações do terraform, ex. versão mínima, backend, etc.
    required_version = ">= 0.12"
    backend "s3" {
        bucket         = "meu-bucket-terraform"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
        dynamodb_table = "terraform-locks"
    }
}

provider "aws" {
#  Configurações do provedor, ex. aws
    region = "us-east-1"
}

resource "aws_s3_bucket" "referencia_interna_codigo" {
# Configuração de um recurso, por exemplo, um bucket S3 com um nome referenca_interna_codigo, somente de referencia interna (ID Unico)
    bucket = "referencia-interna-codigo-unique-id"
    tags = {
        Name        = "Referencia Interna Codigo"
        Environment = "Development"
    }
}

data "aws_s3_bucket" "referencia_interna_codigo" {
# Configuração de um data source, por exemplo, para buscar informações de um bucket S3 criado fora do terraform com o nome referenca_interna_codigo
    bucket = aws_s3_bucket.referencia_interna_codigo.id
}

module "referencia_interna_codigo" {
# Configuração de um módulo, por exemplo, um módulo que pode ser reutilizado em diferentes partes do código
    source = "./modulo_referencia_interna_codigo"
    nome_variavel = "valor_exemplo"
}

variable "nome_variavel" {
# Definição de uma variável, por exemplo, uma variável que pode ser usada em todo o código
    description = "Uma variável de exemplo"
    type        = string
    default     = "valor_padrao"
}

output "nome_output" {
# Definição de um output, por exemplo, um output que retorna o nome do bucket S3 criado, expor uma informação para ser usada fora do terraform
    value = aws_s3_bucket.referencia_interna_codigo.bucket
    description = "O nome do bucket S3 criado"
}

locals {
# Definição de variáveis locais, por exemplo, uma variável local que pode ser usada em todo o código
    nome_local = "valor_local"
}

import {
# Importa um recurso existente para o estado do Terraform
    id  = "resource-identifier"
    to  = aws_s3_bucket.referencia_interna_codigo
}

moved {
# Move um recurso de um local para outro no estado do Terraform 'renomeando' o recurso
    from = aws_s3_bucket.referencia_interna_codigo
    to   = aws_s3_bucket.referencia_interna_codigo
}

# removed {
# Remove um recurso do estado do Terraform, mas não o exclui fisicamente
    # resource = aws_s3_bucket.referencia_interna_codigo
# }

check "referencia_interna_codigo" {
    # Verifica a configuração do recurso, por exemplo, se o bucket S3 atende a certos critérios
    assert {
        condition     = aws_s3_bucket.referencia_interna_codigo.bucket != null && aws_s3_bucket.referencia_interna_codigo.tags["Environment"] == "Development"
        error_message = "O bucket S3 deve ter um nome e estar no ambiente de desenvolvimento."
    }
}
