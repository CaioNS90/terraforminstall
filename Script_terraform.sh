#!/bin/bash

# Baixa e adiciona a chave GPG da HashiCorp ao keyring
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Adiciona o repositório da HashiCorp ao sources.list.d
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Atualiza a lista de pacotes e instala o Terraform
sudo apt update && sudo apt install terraform