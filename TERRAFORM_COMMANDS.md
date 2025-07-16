# Principais Comandos do Terraform

```bash
sudo docker container run -it --name terraform -v "$(pwd):/mnt/terraform-project" --entrypoint /bin/sh hashicorp/terraform
```
```bash
terraform init chdir=path/to/folder
```

## 📋 Índice
- [Comandos Básicos](#comandos-básicos)
- [Comandos de Estado](#comandos-de-estado)
- [Comandos de Configuração](#comandos-de-configuração)
- [Comandos de Workspace](#comandos-de-workspace)
- [Comandos de Módulos](#comandos-de-módulos)
- [Comandos Úteis](#comandos-úteis)
- [Comandos de Debug](#comandos-de-debug)

---

## 🚀 Comandos Básicos

### `terraform init`
Inicializa um diretório de trabalho do Terraform.
```bash
terraform init
terraform init -upgrade              # Atualiza providers
terraform init -reconfigure          # Reconfigura backend
```

### `terraform plan`
Cria um plano de execução mostrando as mudanças que serão aplicadas.
```bash
terraform plan
terraform plan -out=plano.tfplan     # Salva o plano em arquivo
terraform plan -var="environment=prod" # Define variável
terraform plan -target=aws_instance.web # Planeja apenas um recurso
```

### `terraform apply`
Aplica as mudanças necessárias para alcançar o estado desejado.
```bash
terraform apply
terraform apply plano.tfplan         # Aplica um plano salvo
terraform apply -auto-approve        # Aplica sem confirmação
terraform apply -target=aws_instance.web # Aplica apenas um recurso
```

### `terraform destroy`
Destrói a infraestrutura gerenciada pelo Terraform.
```bash
terraform destroy
terraform destroy -auto-approve      # Destrói sem confirmação
terraform destroy -target=aws_instance.web # Destrói apenas um recurso
```

---

## 📊 Comandos de Estado

### `terraform show`
Mostra o estado atual ou um plano salvo.
```bash
terraform show
terraform show plano.tfplan          # Mostra um plano específico
terraform show -json                 # Saída em formato JSON
```

### `terraform state`
Comandos avançados para gerenciar o estado.
```bash
terraform state list                 # Lista todos os recursos
terraform state show aws_instance.web # Mostra detalhes de um recurso
terraform state mv old_name new_name  # Renomeia um recurso no estado
terraform state rm aws_instance.web   # Remove recurso do estado
terraform state pull                 # Baixa estado remoto
terraform state push                 # Envia estado para remoto
```

### `terraform refresh`
Atualiza o estado com a infraestrutura real.
```bash
terraform refresh
```

---

## ⚙️ Comandos de Configuração

### `terraform validate`
Valida a sintaxe dos arquivos de configuração.
```bash
terraform validate
```

### `terraform fmt`
Formata os arquivos de configuração seguindo o padrão.
```bash
terraform fmt                        # Formata arquivos no diretório atual
terraform fmt -recursive             # Formata recursivamente
terraform fmt -check                 # Verifica se formatação está correta
terraform fmt -diff                  # Mostra diferenças de formatação
```

### `terraform output`
Mostra os valores de saída definidos.
```bash
terraform output                     # Mostra todas as saídas
terraform output instance_ip         # Mostra saída específica
terraform output -json               # Saída em formato JSON
```

---

## 🏢 Comandos de Workspace

### `terraform workspace`
Gerencia workspaces (ambientes isolados).
```bash
terraform workspace list             # Lista workspaces
terraform workspace new dev          # Cria novo workspace
terraform workspace select prod      # Muda para workspace
terraform workspace delete dev       # Deleta workspace
terraform workspace show             # Mostra workspace atual
```

---

## 📦 Comandos de Módulos

### `terraform get`
Baixa e instala módulos referenciados.
```bash
terraform get
terraform get -update                # Atualiza módulos
```

---

## 🔧 Comandos Úteis

### `terraform version`
Mostra a versão do Terraform e providers.
```bash
terraform version
```

### `terraform providers`
Mostra informações sobre os providers.
```bash
terraform providers                  # Lista providers
terraform providers lock             # Gera arquivo de lock
terraform providers mirror ./mirror  # Espelha providers localmente
```

### `terraform import`
Importa infraestrutura existente para o estado do Terraform.
```bash
terraform import aws_instance.web i-1234567890abcdef0
```

### `terraform taint`
Marca um recurso para ser recriado no próximo apply.
```bash
terraform taint aws_instance.web
```

### `terraform untaint`
Remove a marcação de "taint" de um recurso.
```bash
terraform untaint aws_instance.web
```

---

## 🐛 Comandos de Debug

### `terraform console`
Inicia um console interativo para testar expressões.
```bash
terraform console
```

### `terraform graph`
Gera um gráfico das dependências dos recursos.
```bash
terraform graph | dot -Tpng > graph.png
```

---

## 🌍 Variáveis de Ambiente Úteis

```bash
export TF_LOG=DEBUG                  # Habilita logs detalhados
export TF_LOG_PATH=./terraform.log   # Define arquivo de log
export TF_VAR_environment=production # Define variável
export TF_CLI_ARGS_plan="-parallelism=2" # Args para comando específico
```

---

## 📝 Flags Comuns

### Flags Globais
- `-chdir=/path/to/dir` - Muda diretório de trabalho
- `-parallelism=n` - Limita operações paralelas
- `-var="key=value"` - Define variável
- `-var-file="file.tfvars"` - Carrega arquivo de variáveis
- `-auto-approve` - Pula confirmação interativa
- `-input=false` - Desabilita prompts interativos
- `-no-color` - Desabilita saída colorida
- `-json` - Saída em formato JSON

### Flags de Target
- `-target=resource` - Opera apenas em recursos específicos
- `-replace=resource` - Força substituição de recurso

---

## 💡 Dicas Importantes

1. **Sempre execute `terraform plan` antes de `terraform apply`**
2. **Use workspaces para separar ambientes**
3. **Mantenha o estado em backend remoto para trabalho em equipe**
4. **Use `.terraform.lock.hcl` para versionar providers**
5. **Execute `terraform validate` regularmente**
6. **Use `terraform fmt` para manter código limpo**
---

## 🔗 Recursos Adicionais

- [Documentação Oficial](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Best Practices](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices)
