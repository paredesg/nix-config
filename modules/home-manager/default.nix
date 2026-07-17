{ config, lib, ... }:
{
  imports = [
    ./shell/zsh.nix
    ./shell/starship.nix
    ./editors/neovim.nix
    
    ./apps/bat.nix
    ./apps/direnv.nix
    ./apps/git.nix
    ./apps/k8s.nix
    ./apps/mc.nix
    ./apps/ripgrep.nix
    
  ];

  home.stateVersion = "26.05";
}