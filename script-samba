#!/bin/bash

apt update
apt upgrade -y
apt install samba -y

arquivo="/etc/samba/smb.conf"
cat << EOF > "$arquivo"
[global]

workgroup = GRUPO
server string = %h server (Samba, Ubuntu)
dns proxy = no
interfaces = lo eth0 eth1
bind interfaces only = true
log file = /var/log/samba/log.%m
max log size = 1000
syslog = 0
panic action = /usr/share/samba/panic-action %d
security = share
encrypt passwords = true
passdb backend = tdbsam
obey pam restrictions = yes
guest account = nobody
invalid users = root
passwd program = /usr/bin/passwd %u

[Servidor]
comment = Servidor de Arquivos
path = /home/servidor
browseable = yes
read only = yes
guest ok = yes

EOF

teste="/home/iftm/servidor"

if [ -f "$teste" ]; then
    chmod 777 /home/iftm/servidor/
else
    mkdir /home/iftm/servidor
    cd /home/iftm
    chmod 777 /home/iftm/servidor/
fi
/etc/init.d/samba restart
