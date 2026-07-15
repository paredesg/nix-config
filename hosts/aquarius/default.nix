{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "aquarius";

  # aquarius est un poste fixe (desktop) : pas de gestion batterie/tactile
  myHardware.isLaptop = false;

  system.stateVersion = "26.05";
}