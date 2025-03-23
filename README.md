# 🌐 Proyecto Multi-región AWS con Terraform

## 📋 Resumen
Despliegue automatizado de dos instancias EC2 en regiones `us-east-1` y `eu-west-2` con comunicación entre ellas mediante peering VPC.

## ✨ Características principales
- 🔄 Comunicación entre regiones con VPC peering
- 🔒 Acceso a puertos SSH (22), RDP (3389) e ICMP
- 🧩 Estructura modular (compute, network, security)
- ⚙️ Configuración personalizable mediante variables

## 🏗️ Estructura

proyecto/
├── main.tf, variables.tf, terraform.tfvars, providers.tf, outputs.tf
└── modules/
├── compute/    # Gestión de instancias EC2
├── network/    # VPCs, subredes y peering
└── security/   # Grupos de seguridad

## 🛠️ Configuración rápida

```bash
terraform init
terraform validate
terraform plan
terraform apply
```
## 🧹 Limpieza

```bash
terraform destroy
```