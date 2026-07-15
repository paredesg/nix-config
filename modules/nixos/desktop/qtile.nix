{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
    xkb.layout = "fr";
    autoRepeatDelay = 200;  
    autoRepeatInterval = 35;
  };

  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "qtile";
  
  environment.systemPackages = with pkgs; [
#    qtile
    python3Packages.psutil     # requis par les widgets CPU/Memory de qtile
#    rofi
#    picom
#    feh
#    dunst
#    xfce.thunar
#    kitty
  ];

  # Nécessaire pour certaines apps Java mal détectées sous qtile
  # environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";
}