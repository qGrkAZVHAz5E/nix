{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # Email client
    thunderbird
    protonmail-bridge

    # Office
    libreoffice-fresh
    pandoc
    obsidian
  ];
}
