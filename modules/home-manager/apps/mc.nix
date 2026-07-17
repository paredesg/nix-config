{ pkgs, ... }: {
  programs.mc = {
    enable = true;
    config = {
      showHiddenFiles = true;
      useInternalEdit = true;
      useInternalView = true;
      confirmView = false;
      confirmEdit = false;};
}
