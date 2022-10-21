{ self }:
let
  home-manager-function = import ../functions/home-manager.nix;

  inputs = self.inputs;

  # Package Sets
  nixpkgs = inputs.stable;
  nixpkgs-unstable = inputs.unstable;

  # Extra modules
  darwin-stable = inputs.darwin-stable;
  darwin-unstable = inputs.darwin-unstable;
  firefox = inputs.firefox-darwin;
  home-manager = inputs.home-manager;
  nur = inputs.nur;

  referenceSelf = { config._module.args.flake = self; };

  standardiseNix = { stable ? false }: {
    environment.etc."nix/inputs/nixpkgs".source =
      if stable then nixpkgs.outPath else nixpkgs-unstable.outPath;
    nix.nixPath = [ "nixpkgs=/etc/nix/inputs/nixpkgs" ];
  };

  localOverlays = import ../overlays;
  overlays = [ firefox.overlay localOverlays nur.overlay ];

  extraModules = [ referenceSelf ];
  config = { allowUnfree = true; };

  x86_64-darwin-stable = import nixpkgs {
    system = "x86_64-darwin";
    inherit overlays extraModules config;
  };

  x86_64-darwin-unstable = import nixpkgs-unstable {
    system = "x86_64-darwin";
    inherit overlays extraModules config;
  };

  aarch64-darwin-stable = import nixpkgs {
    system = "aarch64-darwin";
    inherit overlays extraModules config;
  };

  aarch64-darwin-unstable = import nixpkgs-unstable {
    system = "aarch64-darwin";
    inherit overlays extraModules config;
  };

in {
  HF0012461 = let
    inherit (aarch64-darwin-unstable) system;
    pkgs = aarch64-darwin-unstable;
    modules = home-manager-function {
      inherit home-manager self;
      hostname = "HF0012461";
      isLinux = false;
      extraModules = [ { nixpkgs.overlays = overlays; } (standardiseNix { }) ];
    };
  in darwin-unstable.lib.darwinSystem {
    inherit system;
    inherit modules;
  };
}
