{ pkgs, ... }:
{
  # Comptes gérés uniquement de manière déclarative (pas de useradd manuel)
  users.mutableUsers = false;

  programs.zsh.enable = true;

  users.users.eve = {
    isNormalUser = true;
    description = "Eve";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.zsh;
    # Générer le hash avec : mkpasswd -m sha-512
    # puis coller le résultat dans un fichier hors dépôt git, référencé ici :
    hashedPasswordFile = "/etc/nixos/secrets/eve.hashedpassword";
  };

  users.users.bob = {
    isNormalUser = true;
    description = "Bob";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh;
    hashedPasswordFile = "/etc/nixos/secrets/bob.hashedpassword";
  };
}