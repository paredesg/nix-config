{ ... }:
{
  imports = [
    ./shell/zsh.nix
    ./shell/starship.nix
    ./editors/neovim.nix
    ./apps/git.nix
  ];

  home.stateVersion = "26.05";
}