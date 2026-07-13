{ pkgs, ... }:
{
  imports = [
    ../../modules/home-manager
    ../../modules/home-manager/desktop/qtile
  ];

  home.username = "eve";
  home.homeDirectory = "/home/eve";

  #programs.git.userName = "Eve";
  #programs.git.userEmail = "eve@example.com";
}