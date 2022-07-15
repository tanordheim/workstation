# Workstation

## OS installation

### MacOS

- Install MacOS normally.
- Install Rosetta 2 (`sudo softwareupdate --install-rosetta`).
- Install XCode command line tools (`xcode-select --install`).
- Clone https://github.com/tanordheim/workstation.git.
- Create the `.vault_password` file in the repo checkout containing the Vault secret.
- Install Homebrew.
- Install Ansible with Homebrew.
- Do initial system provisioning with: `ansible-galaxy install -r requirements.yml && ansible-playbook playbook.yml -t bootstrap`
- Create a new checkout of the repository under the `trond` user and run a full ansible run.
