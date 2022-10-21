{
  imports = [
    ../../modules/alacritty
    # ../../modules/dconf
    ../../modules/firefox
    ../../modules/brave
    ../../modules/git
    ../../modules/gtk
    ../../modules/lsd
    ../../modules/messengers
    ../../modules/office
    ../../modules/rofi
    ../../modules/security
    ../../modules/vscode
    ../../modules/tmux

    ../../modules/hacking/burp
    ../../modules/hacking/api/mitmproxy
    ../../modules/hacking/api/postman

    ../../packages/x86_64-linux.nix
  ];
  manual.manpages.enable = false;
}
