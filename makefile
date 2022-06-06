.DEFAULT_GOAL := ping

INV = './inventory/server.ini'

DIR_DEB = './playbook/debian/'
DIR_PROX = './playbook/proxmox/'

TARGET_ALL = 'proxmox,debian'

ping:
	ansible -i ${INV} ${TARGET_ALL} -m ping --user root

update:
	ansible-playbook ${DIR_DEB}safe-upgrade.yml --user root -i ${INV}