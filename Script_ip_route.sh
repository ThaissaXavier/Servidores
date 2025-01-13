#!/bin/bash

# Verifica se o script está sendo executado como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script deve ser executado como root." 
   exit 1
fi

# Variáveis de configuração
INTERFACE="eth0" # Interface de rede
GATEWAY="192.168.1.1" # Gateway padrão
NETWORK1="192.168.10.0/24" # Rede 1
NETWORK1_GATEWAY="192.168.1.254" # Gateway para a Rede 1
NETWORK2="10.0.0.0/16" # Rede 2
NETWORK2_GATEWAY="192.168.1.253" # Gateway para a Rede 2

# Adiciona a rota padrão
echo "Adicionando rota padrão..."
ip route add default via $GATEWAY dev $INTERFACE

# Adiciona rota para a Rede 1
echo "Adicionando rota para a Rede 1 ($NETWORK1)..."
ip route add $NETWORK1 via $NETWORK1_GATEWAY dev $INTERFACE

# Adiciona rota para a Rede 2
echo "Adicionando rota para a Rede 2 ($NETWORK2)..."
ip route add $NETWORK2 via $NETWORK2_GATEWAY dev $INTERFACE

# Exibe as rotas configuradas
echo "Rotas configuradas:"
ip route show

echo "Configuração de rotas concluída."
