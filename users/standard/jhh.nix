{
  name = "jhh";
  initialHashedPassword =
    "$6$B9qYtN8q2dmk4EbR$ZvAWDBkaNvS8vVjhPaOZloatM5/pnMjR3ISg7SrnrjaM9qw2h8KhxkQb/N2e9U5Uxpob2v6m6P8lMVM2M.R/y/";
  extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
  openssh.authorizedKeys.keys = [ "" ];
  shell = "zsh";
}
