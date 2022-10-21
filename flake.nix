{
  description = "NixOS/Darwin configurations";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-22.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin-stable = {
      inputs.nixpkgs.follows = "stable";
      url = "github:lnl7/nix-darwin/master";
    };

    darwin-unstable = {
      inputs.nixpkgs.follows = "unstable";
      url = "github:lnl7/nix-darwin/master";
    };

    home-manager.url = "github:rycee/home-manager/release-22.05";
    firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, ... }: {
    nixosConfigurations = import ./linux/configurations.nix { inherit self; };
    darwinConfigurations = import ./darwin/configurations.nix { inherit self; };

  };
}
