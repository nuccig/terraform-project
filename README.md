# 🏗️ Terraform Project

## 📋 Descrição
Repositório educacional completo de Terraform e Infrastructure as Code (IaC), contendo múltiplos projetos práticos que demonstram desde conceitos básicos até implementações avançadas com remote state, módulos, metaargumentos e integração com AWS e Azure.

## 🚀 Tecnologias Utilizadas
- **Terraform** - Infrastructure as Code
- **AWS** - Provedores de nuvem principal
- **Azure** - Implementações multi-cloud
- **S3** - Remote state backend
- **DynamoDB** - State locking
- **EC2** - Instâncias de computação
- **VPC** - Redes e conectividade
- **Docker** - Containerização para ambientes

## 📁 Estrutura do Projeto
```
terraform-project/
├── azure/                        # Implementações Azure
│   ├── main.tf                   # Provider e configurações
│   ├── storage_account.tf        # Conta de armazenamento
│   └── variables.tf              # Variáveis do projeto
├── backend/                      # Configuração de remote state
│   ├── main.tf                   # Backend S3 configurado
│   └── network.tf                # Recursos de rede
├── modules/                      # Módulos reutilizáveis
│   ├── main.tf                   # Configuração principal
│   ├── vm.tf                     # Máquinas virtuais
│   └── network/                  # Módulo de rede
├── functions/                    # Criação e entendimento de funções do terraform
├── local_state/                  # Exemplos com estado local
├── metaarguments/               # Demonstração de meta-argumentos
├── move_removed_import/         # Comandos move, removed e import
├── pipeline-terraform/          # Pipeline CI/CD
├── provisioners/                # Provisioners e configuração de VMs
├── remote_state/                # Configuração de estado remoto
├── s3/                          # Recursos S3
├── examples/                    # Exemplos gerais
├── extra_resources/             # Recursos adicionais
├── user-data/                   # Scripts de inicialização
├── vm_remote_state/             # VMs com estado remoto
└── TERRAFORM_COMMANDS.md        # Guia de comandos Terraform
```

## ⚡ Funcionalidades
### Infraestrutura AWS
- **VPC e Redes** - Configuração completa de rede
- **EC2 Instances** - Máquinas virtuais configuradas
- **S3 Buckets** - Armazenamento de objetos
- **Lambda Functions** - Computação serverless
- **Remote State** - Estado compartilhado e locking

### Infraestrutura Azure
- **Resource Groups** - Organização de recursos
- **Storage Accounts** - Contas de armazenamento
- **Virtual Networks** - Configuração de rede

### Conceitos Avançados
- **Módulos Reutilizáveis** - Código organizizado e reutilizável
- **Meta-argumentos** - count, for_each, depends_on
- **State Management** - Local e remote state
- **Import/Move/Remove** - Gerenciamento de recursos existentes
- **Provisioners** - Configuração pós-deploy

## � Tópicos de Infraestrutura Estudados por Projeto

### 1. **azure/** - Provedores Multi-Cloud
- **Provider AzureRM** - Configuração de provedores para Azure
- **Resource Groups** - Organização lógica de recursos
- **Storage Accounts** - Armazenamento blob no Azure
- **Storage Containers** - Contêineres para organização de dados
- **Variables e Locals** - Parametrização e valores locais
- **Tags** - Padronização de metadados

### 2. **backend/** - Estado Remoto e Networking
- **Remote State S3** - Armazenamento compartilhado de estado
- **State Locking DynamoDB** - Controle de concorrência
- **VPC** - Virtual Private Cloud completa
- **Subnets** - Segmentação de rede
- **Internet Gateway** - Conectividade externa
- **Route Tables** - Roteamento de tráfego
- **Security Groups** - Controle de firewall

### 3. **modules/** - Modularização
- **Estrutura de Módulos** - Organização em diretórios
- **Input Variables** - Parametrização de módulos
- **Output Values** - Exposição de dados
- **Module Sources** - Referenciamento local
- **VPC Module** - Networking modularizado
- **Dependency Management** - Gestão de dependências

### 4. **functions/** (renomeado para bucket management)
- **S3 Buckets** - Armazenamento de objetos
- **Conditional Resources** - count com condicionais
- **For_each Loops** - Iteração com sets/maps
- **Dynamic Naming** - Nomenclatura baseada em variáveis
- **Environment-based Resources** - Recursos por ambiente

### 5. **metaarguments/** - Meta-argumentos Terraform
- **Count** - Múltiplas instâncias de recursos
- **For_each** - Iteração com maps/sets
- **Depends_on** - Dependências explícitas
- **Lifecycle Rules** - create_before_destroy, ignore_changes, prevent_destroy
- **Provider Aliases** - Múltiplos provedores
- **Cross-Region Resources** - Recursos em regiões diferentes

### 6. **move_removed_import/** - Gerenciamento de Estado
- **Moved Blocks** - Refatoração sem destruição
- **Removed Blocks** - Remoção controlada do estado
- **Import Blocks** - Importação de recursos existentes
- **State Refactoring** - Reorganização de código
- **Resource Lifecycle** - Controle de ciclo de vida

### 7. **pipeline-terraform/** - Estrutura de Pipeline
- **Environment Separation** - Isolamento de ambientes
- **Remote State Organization** - Organização de estados
- **Standardized Naming** - Convenções de nomenclatura
- **Tag Management** - Gestão consistente de tags

### 8. **provisioners/** - Configuração Pós-Deploy
- **Local-exec Provisioner** - Comandos locais
- **Remote-exec Provisioner** - Comandos remotos
- **File Provisioner** - Upload de arquivos
- **Connection Blocks** - Configuração SSH
- **Key Pair Management** - Gestão de chaves SSH
- **Data Sources** - Referência a recursos remotos

### 9. **local_state/** vs **remote_state/** - Estratégias de Estado
- **Local State** - Estado local (terraform.tfstate)
- **Remote State** - Estado compartilhado S3
- **Multi-Provider Setup** - AWS e Azure simultâneos
- **State Isolation** - Separação de estados por projeto
- **Backend Configuration** - Configuração de backends

### 10. **examples/** - Fundamentos
- **Provider Configuration** - Configuração básica
- **Version Constraints** - Controle de versões
- **Multi-Provider** - AWS e Azure
- **Backend Setup** - Configuração de estado remoto
- **Best Practices** - Estruturação de código

### 11. **s3/** - Armazenamento Básico
- **S3 Bucket Creation** - Criação simples de buckets
- **Resource Naming** - Convenções de nomenclatura
- **Basic Configuration** - Configuração mínima

### 12. **user-data/** - Inicialização de VMs
- **EC2 Instances** - Máquinas virtuais AWS
- **User Data Scripts** - Scripts de inicialização
- **Key Pairs** - Autenticação SSH
- **Network Integration** - Integração com VPC existente
- **Data Sources** - terraform_remote_state
- **Software Installation** - Docker via user-data

### 13. **extra_resources/** - Recursos Avançados
- **Check Blocks** - Validação e testes
- **Assertions** - Condições de validação
- **Error Handling** - Tratamento de erros
- **Resource Validation** - Verificação de recursos

### 14. **vm_remote_state/** - VMs com Estado Compartilhado
- **Instance Management** - EC2 com estado remoto
- **Network Dependencies** - Dependências de rede
- **Cross-Project References** - Referências entre projetos
- **Resource Isolation** - Isolamento de recursos

## 📖 Recursos de Referência
- [TERRAFORM_COMMANDS.md](./TERRAFORM_COMMANDS.md) - Guia completo de comandos

---
**Desenvolvido para aprendizado de Infrastructure as Code com Terraform** 🚀