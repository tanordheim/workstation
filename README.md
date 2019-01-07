# Workstation Setup

This repository contains my macOS workstation setup, managed by Ansible.

## Bootstrapping

- Install XCode command line tools: `xcode-select --install`
- Clone the repository: `git clone https://github.com/tanordheim/workstation.git`
- Install Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Install Ansible: `brew install ansible`
- Write the Ansible Vault password file: `echo 'PASSWORD' > ~/.vault-pass.txt && chmod 0600 ~/.vault-pass.txt`
- Run Ansible: `ansible-playbook -i localhost playbook.yml -K --vault-password-file ~/.vault-pass.txt`
