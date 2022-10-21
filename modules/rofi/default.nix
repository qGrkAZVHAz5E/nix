{ pkgs, ... }: {

  programs.rofi = {
    enable = true;
    theme = ./blurry.rasi;
    terminal = "${pkgs.alacritty}/bin/alacritty";
  };
}
