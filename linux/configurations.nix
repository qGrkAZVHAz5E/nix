{ self }:
let
  home-manager-function = import ../functions/home-manager.nix;

  inputs = self.inputs;

  # Package Sets
  stable = inputs.stable;
  nixpkgs = inputs.stable;
  unstable = inputs.unstable;
  nixpkgs-unstable = inputs.unstable;

  # Pull recusrive update out to use it later
  inherit (stable.lib) recursiveUpdate;

  # Extra modules
  home-manager = inputs.home-manager;
  nur = inputs.nur;

  referenceSelf = { config._module.args.flake = self; };

  standardiseNix = { stable ? false }: {
    environment.etc."nix/inputs/nixpkgs".source =
      if stable then nixpkgs.outPath else nixpkgs-unstable.outPath;
    nix.nixPath = [ "nixpkgs=/etc/nix/inputs/nixpkgs" ];
  };

  # Load local overlays and merge with upstream options
  localOverlays = import ../overlays;
  overlays = [ nur.overlay localOverlays ];

  x86_64-linux-stable = import nixpkgs {
    system = "x86_64-linux";
    inherit overlays;
    config = { allowUnfree = true; };
  };

  x86_64-linux-unstable = import nixpkgs-unstable {
    system = "x86_64-linux";
    inherit overlays;
    config = { allowUnfree = true; };
  };

  aarch64-linux-stable = import nixpkgs {
    system = "aarch64-linux";
    inherit overlays;
    config = { allowUnfree = true; };
  };

  aarch64-linux-unstable = import nixpkgs-unstable {
    system = "aarch64-linux";
    inherit overlays;
    config = { allowUnfree = true; };
  };

in {
  nixos-jhh = let
    inherit (x86_64-linux-unstable) system;
    pkgs = x86_64-linux-unstable;
    modules = home-manager-function {
      inherit home-manager self;
      hostname = "nixos-jhh";
      extraModules = [ referenceSelf (standardiseNix {}) ];
    };
  in unstable.lib.nixosSystem { inherit system pkgs modules; };
}
