{ config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;

  environment.systemPackages =
    if isDarwin then with pkgs; [ oh-my-zsh ] else [ ];

  shellAliases = with pkgs; {
    ls = "lsd";
    cp = "xcp";
    python = "python3";
    update = "sudo nix-channel --update";
    rebuild = "sudo nixos-rebuild switch";
    test-flake = "nixos-rebuild test --flake .# -L -v --use-remote-sudo";
    rebuild-linux = "nixos-rebuild switch --flake .# -L -v --use-remote-sudo";
    rebuild-darwin = "darwin-rebuild switch --flake .# -L -v";
  };

in {
  programs.zsh = {
    inherit shellAliases;
  } // (if isDarwin then {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];

    initExtra = ''
      source ${./p10k.zsh}
    '';

    oh-my-zsh = {
      enable = true;
      theme = "risto";
    };
  } else {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    promptInit =
      "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    shellInit = "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh";
    ohMyZsh = { enable = true; };
  });
}
