{ config, pkgs, flake, ... }:
let
  userFunction = import ../../functions/map-reduce-users.nix;
  userConfigs = import ./users.nix;
  users = userFunction { inherit pkgs userConfigs; };
in {
  inherit users;

  imports = [
    ./hardware-configuration.nix
    ./modules.nix
    ./networking.nix
    ./system-packages.nix
  ];

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
      setLdLibraryPath = true;
    };
    nvidia = { modesetting.enable = true; };
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      efi.efiSysMountPoint = "/boot/efi";
  };
    kernelPackages =
      pkgs.linuxPackages_latest; # Use latest kernel stable available
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Australia/Brisbane";
  system.stateVersion = "22.11";
}
