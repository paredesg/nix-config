{ pkgs, ... }:

{
  fonts.packages = with pkgs.nerd-fonts; [
    fira-code
    jetbrains-mono
    meslo-lg
    hack
    dejavu-sans-mono
  ];

  fonts.fontconfig.enable = true;
}
