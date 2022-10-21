{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # Security
    opensnitch-ui
    veracrypt
  ];
}
