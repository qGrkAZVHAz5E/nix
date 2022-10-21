{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # CLI
    curl
    vim
    wget
    xcp
    p7zip
    htop

    # SMB/CIFS/NFS mounting
    cifs-utils
    nfs-utils

    # Virtualisation
    docker
    docker-compose

    # Yubikey
    libfido2

    # Nvidia
    linuxPackages.nvidia_x11

    # Vulkan
    #vulkan-extension-layer
    vulkan-headers
    vulkan-tools
    steam-run-native

    # Proton
    protonup

    # System Notifications
    libnotify

    # Audio
    jack2
  ];
}
