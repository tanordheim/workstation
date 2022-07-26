# Workstation

- Install MacOS normally.
- Install Rosetta 2 (`sudo softwareupdate --install-rosetta`).
- Install XCode command line tools (`xcode-select --install`).
- Clone https://github.com/tanordheim/workstation.git.
- Create the `.vault_password` file in the repo checkout containing the Vault secret.
- Install Homebrew.
- Install Ansible with Homebrew.
- Do initial system provisioning with: `ansible-galaxy install -r requirements.yml && ansible-playbook playbook.yml -t bootstrap`
- Create a new checkout of the repository under the `trond` user and run a full ansible run.

## Post installation steps

- Import `ìterm2.json` iTerm profile into iTerm.
- Disable SIP for Yabai to work optimally as per [the Yabai docs](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection).
- Start the skhd services as per [the skhd docs](https://github.com/koekeishiya/skhd).
- Install and load the Yabai scripting addition as per [the Yabai docs](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)).
