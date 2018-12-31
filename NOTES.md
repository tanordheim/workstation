# Notes during initial setup

- Installed blank Arch installation in VirtualBox.
- Install Ansible (`sudo pacman -S ansible`).
- Install some prerequisites for Ansible runs (`sudo pacman -S python git openssh sudo`).
- Make sure the current user is in the `wheel` group, and allow `wheel` group to sudo.
- Clone the workstation repo (`mkdir -p ~/Dev/src/github.com/tanordheim/workstation && git clone https://github.com/tanordheim/workstation ~/Dev/src/github.com/tanordheim/workstation`).
- Write the Ansible Vault password to `~/.vault-pass.txt` (`echo 'PASSWORD' > ~/.vault-pass.txt && chmod 0600 ~/.vault-pass.txt`).
- Run Ansible (`(cd ~/Dev/src/github.com/tanordheim/workstation && ansible-playbook -i localhost playbook.yml -K --vault-password-file ~/.vault-pass.txt)`).
