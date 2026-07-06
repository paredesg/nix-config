{ ... }:
{
  # Programmes lancés automatiquement à l'ouverture de session
  # (.xprofile est sourcé par SDDM avant le démarrage de qtile)
  home.file.".xprofile".text = ''
    picom --config ~/.config/picom/picom.conf &
    dunst &
    feh --bg-fill ~/.config/qtile/wallpaper.jpg &
  '';
}