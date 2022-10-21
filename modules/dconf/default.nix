# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "apps/telepathy-logger" = { enabled = false; };

    "ca/desrt/dconf-editor" = {
      saved-pathbar-path =
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings";
      saved-view =
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings";
      show-warning = false;
      window-height = 1301;
      window-is-maximized = false;
      window-width = 820;
    };

    "io/elementary/files/preferences" = {
      active-tab-position = 0;
      default-viewmode = "icon";
      sidebar-width = 191;
      window-position = mkTuple [ 1234 216 ];
      window-size = mkTuple [ 1000 680 ];
      window-state = "normal";
    };

    "org/gnome/Connections" = { first-run = false; };

    "org/gnome/control-center" = { last-panel = "keyboard"; };

    "org/gnome/desktop/calendar" = { show-weekdate = false; };

    "org/gnome/desktop/input-sources" = {
      per-window = true;
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = false;
      clock-show-weekday = true;
      cursor-theme = "Nordzy-cursors";
      enable-hot-corners = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Cantarell 11";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "Nordic-darker";
      icon-theme = "Tela-circle-dark";
      monospace-font-name = "Hack Nerd Font Mono 10";
      show-battery-percentage = false;
    };

    "org/gnome/desktop/media-handling" = {
      autorun-never = true;
      autorun-x-content-ignore = [ ];
      autorun-x-content-open-folder = [ ];
      autorun-x-content-start-app = [ "x-content/ostree-repository" ];
    };

    "org/gnome/desktop/notifications" = {
      application-children = [
        "signal-desktop"
        "discord"
        "gnome-network-panel"
        "com-gitlab-newsflash"
      ];
    };

    "org/gnome/desktop/notifications/application/com-gitlab-newsflash" = {
      application-id = "com.gitlab.newsflash.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-tour" = {
      enable = false;
    };

    "org/gnome/desktop/notifications/application/signal-desktop" = {
      application-id = "signal-desktop.desktop";
    };

    "org/gnome/desktop/privacy" = {
      disable-microphone = false;
      hide-identity = true;
      remember-app-usage = false;
      remember-recent-files = false;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [
        "org.gnome.Calendar.desktop"
        "org.gnome.clocks.desktop"
        "org.gnome.seahorse.Application.desktop"
      ];
      sort-order = [
        "org.gnome.Contacts.desktop"
        "org.gnome.Documents.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };

    "org/gnome/desktop/session" = { idle-delay = "uint32 0"; };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ ];
      maximize = [ ];
      switch-to-workspace-left = [ "<Primary>Left" ];
      switch-to-workspace-right = [ "<Primary>Right" ];
      unmaximize = [ ];
    };

    "org/gnome/desktop/wm/preferences" = { button-layout = "appmenu:close"; };

    "org/gnome/eog/view" = {
      background-color = "rgb(0,0,0)";
      use-background-color = true;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/file-roller/dialogs/extract" = {
      recreate-folders = true;
      skip-newer = false;
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      focus-change-on-pointer-rest = true;
      overlay-key = "Super_L";
      workspaces-only-on-primary = true;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 1294 726 ];
      maximized = false;
    };

    "org/gnome/nm-applet/eap/d2647cf2-31cf-4bbc-bf13-518dc8c6b2ff" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
      {
        binding = "<Alt>space";
        command = "rofi -show drun";
        name = "Rofi";
      };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-ac-timeout = "0";
      sleep-inactive-battery-timeout = "";
      power-saver-profile-on-low-battery = false;
      idle-dim = false;
    };

    "org/gnome/shell/extensions/arcmenu" = {
      arc-menu-placement = "DTP";
      available-placement = [ false true false ];
      border-color = "rgb(32,32,32)";
      button-padding = -1;
      custom-menu-button-icon = "/home/kirin/Icons/Nix_snowflake.svg";
      custom-menu-button-icon-size = 26.0;
      enable-custom-arc-menu = true;
      enable-menu-button-arrow = false;
      highlight-color = "rgb(165,29,45)";
      highlight-foreground-color = "rgba(255,255,255,1)";
      menu-arrow-size = 12;
      menu-border-size = 1;
      menu-button-icon = "Custom_Icon";
      menu-button-position-offset = 0;
      menu-color = "rgba(53,53,53,0.987)";
      menu-corner-radius = 5;
      menu-font-size = 9;
      menu-foreground-color = "rgb(223,223,223)";
      menu-margin = 24;
      multi-monitor = true;
      pinned-app-list = [
        "Firefox"
        ""
        "firefox.desktop"
        "Files"
        ""
        "org.gnome.Nautilus.desktop"
        "Terminal"
        ""
        "org.gnome.Terminal.desktop"
        "ArcMenu Settings"
        "ArcMenu_ArcMenuIcon"
        "gnome-extensions prefs arcmenu@arcmenu.com"
      ];
      prefs-visible-page = 0;
      recently-installed-apps = [ "com.gitlab.newsflash.desktop" ];
      separator-color = "rgb(32,32,32)";
      show-activities-button = false;
      vert-separator = false;
    };

    "org/gnome/shell/extensions/bluetooth-quick-connect" = {
      bluetooth-auto-power-on = true;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      appfolder-dialog-opacity = 0.12;
      brightness = 0.6;
      dash-opacity = 0.12;
      debug = false;
      hidetopbar = false;
      sigma = 30;
    };

    "org/gnome/shell/extensions/custom-hot-corners-extended/misc" = {
      supported-active-extensions = [ "ArcMenu" ];
    };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-bottom-right-0" =
      {
        action = "show-applications";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-bottom-right-1" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-bottom-right-2" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-bottom-right-3" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-bottom-right-4" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-bottom-right-5" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-top-left-0" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-top-left-1" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-top-left-2" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-top-left-3" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-top-left-4" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/custom-hot-corners-extended/monitor-0-top-left-5" =
      {
        action = "disabled";
      };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover = false;
      animate-appicon-hover-animation-extent =
        "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [ 0 ];
      dot-color-dominant = false;
      dot-color-override = false;
      dot-position = "TOP";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      focus-highlight-color = "#a51d2d";
      focus-highlight-dominant = true;
      focus-highlight-opacity = 35;
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      leftbox-padding = -1;
      leftbox-size = 0;
      panel-anchors = ''{"0":"MIDDLE"}'';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"centered"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}'';
      panel-lengths = ''{"0":100}'';
      panel-positions = ''{"0":"TOP"}'';
      panel-sizes = ''{"0":32}'';
      show-appmenu = false;
      show-favorites = false;
      show-running-apps = true;
      status-icon-padding = 16;
      stockgs-keep-top-panel = false;
      trans-bg-color = "#131212";
      trans-panel-opacity = 0.8;
      trans-use-custom-bg = true;
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = false;
      tray-padding = -1;
      tray-size = 0;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/extensions/improved-workspace-indicator" = {
      skip-taskbar-mode = true;
    };

    "org/gnome/shell/extensions/notification-banner-reloaded" = {
      anchor-horizontal = 1;
      animation-direction = 1;
      padding-horizontal = 5;
      padding-vertical = 5;
    };

    "org/gnome/shell/extensions/pop-shell" = {
      active-hint = true;
      gap-inner = "uint32 8";
      gap-outer = "uint32 8";
      smart-gaps = false;
      snap-to-grid = false;
      tile-by-default = true;
    };

    "org/gnome/shell/extensions/user-theme" = { name = "Nordic-darker"; };

    "org/gnome/tweaks" = { show-extensions-notice = false; };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [
        (mkTuple [ 8.2353e-2 0.32549 ])
        (mkTuple [ 7.3333e-2 7.0644e-2 ])
        (mkTuple [ 0.933333 0.933333 ])
      ];
      selected-color = mkTuple [ true 0.647059 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 175;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-size = mkTuple [ 1232 695 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 182;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 1105 262 ];
      window-size = mkTuple [ 1231 902 ];
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 1314;
      manager-window-width = 1672;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/details" = { show-toolbar = true; };

    "org/virt-manager/virt-manager/paths" = {
      media-default = "/home/kirin/ISOs";
    };
  };
}
