{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "vm";

  # vm est un poste virtuel (VM) : pas de gestion batterie/tactile
  myHardware.isLaptop = false;

  system.stateVersion = "26.05";
}