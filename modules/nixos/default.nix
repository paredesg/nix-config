{ lib, ... }:
{
  imports = [
    ./boot.nix
    ./networking.nix
    ./audio.nix
    ./fonts.nix
    ./users.nix
    ./hardware.nix
    ./desktop/qtile.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  console.keyMap = "fr";


  # Nettoyage automatique du store
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}