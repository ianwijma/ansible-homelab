.DEFAULT_GOAL := ping

INV = './inventory/server.ini'

DIR_DEB = './playbook/ubuntu/'
DIR_PROX = './playbook/proxmox/'

TARGET_ALL = 'proxmox,ubuntu'

ping:
	ansible -i ${INV} ${TARGET_ALL} -m ping --user root

setupServer:
	ansible-playbook ./adhoc/setup.yml --user server --ask-pass --ask-become

update:
	ansible-playbook ${DIR_DEB}safe-upgrade.yml --user root -i ${INV}