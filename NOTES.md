# Notes during initial setup

- Installed blank Arch installation in VirtualBox.
- Install Ansible (`sudo pacman -S ansible`).
- Install some prerequisites for Ansible runs (`sudo pacman -S python git openssh`).
- Clone the workstation repo (`mkdir -p ~/Dev/src/github.com/tanordheim/workstation && git clone https://github.com/tanordheim/workstation ~/Dev/src/github.com/tanordheim/workstation`).
- Run Ansible (`(cd ~/Dev/src/github.com/tanordheim/workstation && ansible-playbook -i localhost playbook.yml)`).
