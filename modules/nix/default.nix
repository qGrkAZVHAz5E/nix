{ config, pkgs, ... }:
let
  configs = { aarch64-darwin = import ./x86_64-darwin.nix; };
  configs = { x86_64-darwin = import ./x86_64-darwin.nix; };
  configs = { aarch64-linux = import ./x86_64-linux.nix; };
  configs = { x86_64-linux = import ./x86_64-linux.nix; };
  extraOptions = ''
    experimental-features = nix-command flakes
  '';
in { nix = { inherit extraOptions; } // configs.${pkgs.system}; }
