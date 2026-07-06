{ lib, pkgs, config, ... }:
with lib;
{
  options.myHardware.isLaptop = mkOption {
    type = types.bool;
    default = false;
    description = "Active les services spécifiques aux laptops (énergie, tactile, etc.)";
  };

  config = mkIf config.myHardware.isLaptop {
    services.tlp.enable = true;
    services.upower.enable = true;
    powerManagement.enable = true;
    services.libinput.enable = true; # touchpad

    # Suspend automatique sur fermeture du capot
    services.logind.lidSwitch = "suspend";
  };
}