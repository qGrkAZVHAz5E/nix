{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # GTK Themes
    nordic

    # Icons
    papirus-icon-theme
    tela-circle-icon-theme

    # Cursors
    nordzy-cursor-theme
  ];
}
