{
  gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 7d";
  };
  optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
  settings = {
    trusted-users = [ "jhh" "root"  ];
    allowed-users = [ "@wheel" "jhh" ];
    auto-optimise-store = true;
    sandbox = true;
  };
}
