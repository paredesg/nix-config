{ pkgs, ... }:
{
  imports = [
    ../../modules/home-manager
    ../../modules/home-manager/desktop/qtile
  ];

  home.username = "bob";
  home.homeDirectory = "/home/bob";

#  programs.git.userName = "Bob";
#  programs.git.userEmail = "bob@example.com";
}