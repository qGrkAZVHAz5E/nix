{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # Messengers
    discord
    signal-desktop
    element-desktop
    #nheko (matrix client currently installed via flatpak)
    #mirage-im (matrix client with multiple user support)
    tdesktop
    #slack
  ];
}
