{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "laptop";

  # laptop est un portable : gestion batterie/tactile
  myHardware.isLaptop = true;

  system.stateVersion = "26.05";
}