{ config, osConfig, lib, pkgs, ... }:
{
  imports = [ ./autostart.nix ];

  # Home Manager n'a pas de module natif "programs.qtile" (Qtile se
  # configure via un simple fichier Python) : on le déploie directement.
  xdg.configFile."qtile/config.py".source = ./config.py;

  home.packages = with pkgs; [
    rofi
    picom
    dunst
    feh
    kitty
  ];
}