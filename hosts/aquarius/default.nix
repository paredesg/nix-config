{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "laptop";

  # Active TLP, upower, libinput, etc.
  myHardware.isLaptop = true;

  system.stateVersion = "26.05";
}