# nix-config

Configuration NixOS 26.05 (x86_64-linux), multi-host / multi-user, avec Flakes,
Home Manager et Qtile comme window manager.

## Console
0 sudo -i
1 loadkeys fr
2 passwd  (definir password root user)
3 ip a (verif IP)

## Partitioning
lsblk -o name,size,fstype,label,model,serial,mountpoint 

nvme:
parted /dev/nvme1n1 -- mklabel gpt
parted /dev/nvme1n1 -- mkpart ESP fat32 1MB 512MB
parted /dev/nvme1n1 -- set 1 esp on
parted /dev/nvme1n1 -- mkpart primary 512MB -8GB

sda:
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MB 512MB
parted /dev/sda -- set 1 esp on
parted /dev/sda -- mkpart primary 512MB -8GB

lsblk

## Format

nvme:
mkfs.fat -F 32 -n BOOT /dev/nvme0n1p1
mkfs.ext4 -L NIXOS /dev/nvme0n1p2

sda:
mkfs.fat -F 32 -n BOOT /dev/sda1
mkfs.ext4 -L NIXOS /dev/sda2


## Mount

mount /dev/disk/by-label/NIXOS /mnt
mkdir -p /mnt/boot                          # (for UEFI systems only)
mount /dev/disk/by-label/BOOT /mnt/boot     # (for UEFI systems only)

mount -o remount,size=10G,noatime /nix/.rw-store  # (more space during install)
df -h

## Hosts

| Host      | Type    | Users        |
|-----------|---------|--------------|
| aquarius  | Desktop | eve, bob     |
| laptop    | Laptop  | eve          |
| vm        | Laptop  | eve          |

## Prérequis avant premier déploiement

1. Générer le vrai `hardware-configuration.nix` sur chaque machine :
   ```
   nixos-generate-config --root /mnt
   ```
   puis remplacer le fichier placeholder correspondant dans
   `hosts/<hostname>/hardware-configuration.nix`.

1. git clone https://github.com/paredesg/nix-config.git /mnt/etc/nixos/nix-config
   cp -r /mnt/etc/nixos/nix-config/* /mnt/etc/nixos/

3. Générer les mots de passe hashés (référencés dans `modules/nixos/users.nix`) :
   ```

Exécutez-la deux fois (une pour eve, une pour bob), puis stockez le résultat hors du dépôt git, directement dans le système cible :

mkdir -p /mnt/etc/nixos/secrets
mkpasswd -m sha-512 > /mnt/etc/nixos/secrets/eve.hashedpassword
mkpasswd -m sha-512 > /mnt/etc/nixos/secrets/bob.hashedpassword
chmod 600 /mnt/etc/nixos/secrets/*.hashedpassword
```
Ces fichiers ne doivent PAS être commités dans le dépôt git.
Pour une gestion plus robuste des secrets, envisager `sops-nix` ou `agenix`.


```
# Sur aquarius
nixos-install --root /mnt --flake /mnt/etc/nixos#aquarius

# Sur laptop
nixos-install --root /mnt --flake /mnt/etc/nixos#laptop

# Sur vm
nixos-install --root /mnt --flake /mnt/etc/nixos#vm

```

## Mise à jour des dépendances (nixpkgs, home-manager)

```
nix flake update --flake ~/nix-config
```

## Structure

```
nix-config/
├── flake.nix
├── hosts/                # Config par machine (hardware + assemblage)
│   ├── aquarius/
│   ├── laptop/
│   └── vm/
├── modules/
│   ├── nixos/             # Modules système réutilisables
│   │   └── desktop/qtile.nix
│   └── home-manager/      # Modules Home Manager réutilisables
│       └── desktop/qtile/
├── users/                 # Un home.nix par utilisateur
│   ├── eve/
│   └── bob/
├── overlays/
└── README.md
```