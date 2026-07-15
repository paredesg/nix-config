{ config, lib, ... }:
{
  imports = [
    ./shell/zsh.nix
    ./shell/starship.nix
    ./editors/neovim.nix
    ./apps/git.nix
    ./apps/bat.nix
  ];

  home.stateVersion = "26.05";
}