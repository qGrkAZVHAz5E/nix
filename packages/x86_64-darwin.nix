{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    # CLI Utilities
    git
    htop
    jq
    killall
    lsd
    tree
    unzip
    pspg
    awscli
    xcp
    openssh # Overrides darwin default version which doesn't support yubikeys properly

    # Terminal Candy
    zsh-powerlevel10k

    # Nix
    nixfmt
  ];
}
