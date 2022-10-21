{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # Terminal Utilities
    jq
    yq
    xcp
    dnsutils
    ripgrep
    ranger
    openssl
    killall
    tree

    # Zsh
    zsh-powerlevel10k

    # Terminal Candy
    screenfetch
    neofetch

    # Virtualisation
    virt-manager

    # Nix
    nixfmt

    # MFA
    yubikey-manager-qt
    yubikey-personalization-gui

    # Password Management
    keepassxc

    # Art
    inkscape
    gimp

    # Browsers
    google-chrome
  ];
}
