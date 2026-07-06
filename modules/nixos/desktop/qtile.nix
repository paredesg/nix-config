{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "none+qtile";

  security.polkit.enable = true;
  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    qtile
    python3Packages.psutil     # requis par les widgets CPU/Memory de qtile
    rofi
    picom
    feh
    dunst
    xfce.thunar
    kitty
  ];

  # Nécessaire pour certaines apps Java mal détectées sous qtile
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";
}