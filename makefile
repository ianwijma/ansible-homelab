.DEFAULT_GOAL := ping

INV = './inventory/server.ini'

DIR_DEB = './playbook/ubuntu/'
DIR_PROX = './playbook/proxmox/'

TARGET_ALL = 'proxmox,k3s'

ping:
	ansible -i ${INV} ${TARGET_ALL} -m ping --user root

pingK3s:
	ansible -i ${INV} k3s_first,k3s_other,k3s_workers -m ping --user root

k3sSsh:
	ansible-playbook ./k3s/push_ssh.yml --user root -i ${INV}  --ask-pass

setupServer:
	ansible-playbook ./adhoc/setup.yml --user server --ask-pass --ask-become

update:
	ansible-playbook ${DIR_DEB}safe-upgrade.yml --user root -i ${INV}

setupK3s:
	ansible-playbook ./k3s/setup.yml --user root -i ${INV}