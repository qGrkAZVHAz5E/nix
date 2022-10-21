{ config, pkgs, lib, ... }:
let
  gnomePackages = with pkgs.gnome; [
    gnome-tweaks
    dconf-editor
    gnome-screenshot
  ];
  gnomeExtensions = with pkgs.gnomeExtensions; [
    screenshot-tool
    dash-to-panel
    pop-shell
    blur-my-shell
    notification-banner-reloaded
    improved-workspace-indicator
    custom-hot-corners-extended
    bluetooth-quick-connect
    sound-output-device-chooser
  ];
in {
  imports = [ ../redshift ];

  services.xserver = {
    displayManager = {
      gdm = {
        enable = true;
        wayland = false;
      };
    };
    desktopManager.gnome = { enable = true; };
  };

  services.gvfs.enable = true;

  environment.systemPackages = with pkgs;
    [ gjs ] ++ gnomePackages ++ gnomeExtensions;

  # If using gnome desktop manager, exclude these from installation
  environment.gnome.excludePackages = with pkgs; [
    gnome.cheese
    gnome-photos
    gnome.gnome-music
    gnome.gedit
    epiphany
    evince
    gnome.gnome-characters
    gnome.totem
    gnome.tali
    gnome.iagno
    gnome.hitori
    gnome.atomix
    gnome.gnome-weather
    gnome.gnome-contacts
    gnome.gnome-maps
    gnome.geary
    gnome-tour
    gnome-connections
  ];
}
