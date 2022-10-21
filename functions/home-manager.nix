{ home-manager, hostname, isLinux ? true, extraModules ? [ ], self, ... }:
let
  systemUsers = import ../hosts/${hostname}/users.nix;
  stateVersion.stateVersion = "22.05";
  mappedUsers = builtins.map (x: {
    "${x.name}" = {
      imports = [ ../hosts/${hostname}/user-modules.nix ];
      xdg.configFile."nix/inputs/nixpkgs".source = self.inputs.unstable.outPath;
      home = if (builtins.hasAttr "homeManagerConfig" x) then
        x.homeManagerConfig // stateVersion
      else
        stateVersion;
    };
  }) systemUsers;
  users = builtins.foldl' (x: y: x // y) { } mappedUsers;
  # Configs are generated either for linux systems or for darwin
  config = if isLinux then [
    ../hosts/${hostname}
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users = users;
    }
  ] else [
    ../hosts/${hostname}
    home-manager.darwinModule
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users = users;
    }
  ];
in config ++ extraModules
