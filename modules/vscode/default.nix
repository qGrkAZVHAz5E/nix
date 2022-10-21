{ config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  package = if isDarwin then { } else { package = pkgs.vscodium; };
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    userSettings = {
      "[javascript]" = {
        "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
      };
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[jsonc]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[latex]" = { "editor.defaultFormatter" = "James-Yu.latex-workshop"; };
      "[nix]" = { "editor.defaultFormatter" = "brettm12345.nixfmt-vscode"; };
      "[typescript]" = {
        "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
      };
      "[xml]" = { "editor.defaultFormatter" = "redhat.vscode-xml"; };
      "[yaml]" = { "editor.formatOnSave" = false; };

      "debug.javascript.autoAttachFilter" = "smart";
      "diffEditor.maxComputationTime" = 0;

      "editor.fontFamily" = "Hack Nerd Font";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;
      "editor.formatOnSave" = true;
      "editor.minimap.enabled" = false;
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";

      "workbench.colorTheme" = "GitHub Dark";
      "workbench.iconTheme" = "material-icon-theme";

      "latex-workshop.view.pdf.viewer" = "tab";

      "redhat.telemetry.enabled" = false;
      "security.workspace.trust.untrustedFiles" = "open";

      "terminal.explorerKind" = "external";
      "terminal.external.linuxExec" = "alacritty";
      "terminal.external.osxExec" = "${pkgs.zsh}/Applications/Alacritty.app";
      "terminal.integrated.automationShell.linux" = "nix-shell";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.defaultProfile.osx" = "${pkgs.zsh}/bin/zsh";
      "terminal.integrated.fontFamily" = "Hack Nerd Font";
      "terminal.integrated.fontSize" = 12;

      # temp fix until https://github.com/microsoft/vscode/issues/158052
      "terminal.integrated.shellIntegration.enabled" = false;

    };

    extensions = with pkgs.vscode-extensions; [
      ## Themes
      github.github-vscode-theme
      #arcticicestudio.nord-visual-studio-code
      #dracula-theme.theme-dracula

      ## Icons
      pkief.material-icon-theme

      ## Nix
      bbenoist.nix
      jnoortheen.nix-ide
      brettm12345.nixfmt-vscode
      arrterian.nix-env-selector

      ## Python
      #ms-python.python
      #ms-toolsai.jupyter

      # JS/TS
      dbaeumer.vscode-eslint

      ## Markdown
      yzhang.markdown-all-in-one

      # XML
      dotjoshjohnson.xml

      # YAML
      redhat.vscode-yaml

      ## Latex
      james-yu.latex-workshop

      ## Shell
      timonwong.shellcheck
    ];
  } // package;
}

