.DEFAULT_GOAL := ping

INV = './inventory/server.ini'

DIR_DEB = './playbook/ubuntu/'
DIR_PROX = './playbook/proxmox/'

TARGET_ALL = 'proxmox,k3s'

ping:
	ansible -i ${INV} ${TARGET_ALL} -m ping --user root

ubuntuSetup:
	ansible-playbook ./setups/ubuntu-server.yml --user server --ask-pass --ask-become

ubuntuState:
	ansible-playbook -i ${INV} ./ubuntu-servers/state.yml --user root

update:
	ansible-playbook ${DIR_DEB}safe-upgrade.yml --user root -i ${INV}

k3sPing:
	ansible -i ${INV} k3s_first,k3s_other,k3s_workers -m ping --user root

k3sSsh:
	ansible-playbook ./k3s/push_ssh.yml --user root -i ${INV}

k3sSetup:
	ansible-playbook ./k3s/setup.yml --user root -i ${INV}

k3sInstallRancher:
	ansible-playbook ./k3s/install-rancher.yml ${INV}