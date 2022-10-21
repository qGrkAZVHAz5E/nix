{
  gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    user = "j.mckeown";
  };
  settings = {
    substituters = [ "https://cache.nephalem.io/" ];
    trusted-public-keys =
      [ "cache.nephalem.io:wZHFAvMk7Y4SBYeVOBonFcinefgSAAH9xsREKbgZhGk=" ];
  };
}
