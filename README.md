# Workstation

## OS installation

### Arch Linux

- Install Arch Linux normally. Noteable things to configure:
  - Partitioning:
    - GUID partition table (type EFI System).
    - First partition: 1GB of type EFI System. Format this as Fat32: `mkfs.fat -F32 /dev/PARTITION_1_ID`.
    - Second partition: 2GB of type Linux system. Format as ext4.
    - Third partition: remaining space of type Linux LVM.
  - LVM volumes:
    - Create PV: `pvcreate PARTITION_3_ID`
    - Create VG: `vgcreate nvmevg PARTITION_3_ID`
    - Create LVs: `lvcreate -L SIZE nvmevg -n LABEL`
      - `root` (~50GB)
      - `home` (~10GB)
      - `swap` (32GB)
  - Pacstrap install: remember to add additional packages: `lvm2 vim intel-ucode grub efibootmgr networkmanager`.
  - After install:
    - Add additional settings to /etc/vconsole.conf: FONT=eurlatgr
    - Add `keyboard keymap consolefont` before `modconf`, and `lvm2` before `filesystems` in `HOOKS()`.
    - Add `lvm` to `GRUB_PRELOAD_MODULES` in `/etc/default/grub`.
- Configure basics on the new installation:
  - Enable and start `NetworkManager.service`.
  - Install base software prerequisites:
    - `pacman -S --needed git base-devel ansible`
  - Clone https://github.com/tanordheim/workstation.git.
  - Create the `.vault_password` file in the repo checkout containing the Vault secret.
  - Do initial system provisioning with: `ansible-galaxy install -r requirements.yml && ansible-playbook playbook.yml -t bootstrap`
  - Set a password of the new `trond` user.
- Create a new checkout of the repository under the `trond` user and run a full ansible run.
