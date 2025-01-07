{
  home-manager.users.kano = { pkgs, ... }: {
    home.packages = with pkgs; [
      swww
      swaylock
      pywal

      #utils
      grim
      feh
      swappy
      slurp
      xdg-desktop-portal-hyprland
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        "$mod" = "SUPER";

        monitor = [ "eDP-1, 1920x1080@144, 0x0, 1" ];

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgb(cdd6f4)";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };

        input = {
          kb_layout = "us";
          follow_mouse = 1;

          touchpad = {
            natural_scroll = false;
          };
          sensitivity = 0;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          mouse_move_enables_dpms = true;
          mouse_move_focuses_monitor = true;
          enable_swallow = true;
        };

        decoration = {
          rounding = 6;
          active_opacity = 1.0;
          inactive_opacity = 1.0;

          blur = {
            enabled = false;
          };

          blurls = [ "waybar" "lockscreen" ];
        };

        dwindle = {
          no_gaps_when_only = false;
          pseudotile = true;
          preserve_split = true;
        };

        exec-once = [
          "dbus-update-activation-enviroment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemclt --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "fcitx5 -d"
          "waybar"
          "swww init"
          "nm-applet --indicator"
          #"emacs --daemon"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        bind = [
          #hypr
          "$mod, C, killactive"
          "$mod, V, togglefloating"
          "$mod, P, pseudo"
          "$mod, U, togglesplit"
          "$mod, F, fullscreen"
          "$mod SHIFT, M, exit"
          #apps
          "$mod, O, exec, swaylock"
          "$mod, E, exec, thunar"
          "$mod, Q, exec, alacritty"
          "$mod, D, exec, emacsclient -c"
          "$mod, SPACE, exec, tofi-drun --drun-launch=true"
          "$mod SHIFT, S, exec, grim -t jpeg -q 80 -g '$(slurp)' - | swappy -f -"
          "$mod, S, exec, grim -t jpeg -q 100 -g '$(slurp)' - | feh -B black -"
          #position	
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, u"
          "$mod, k, movefocus, r"
          "$mod, l, movefocus, d"
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, j, movewindow, u"
          "$mod SHIFT, k, movewindow, r"
          "$mod SHIFT, l, movewindow, d"
        ]
        ++ (
          builtins.concatLists (builtins.genList
            (
              x:
              let
                ws =
                  let c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10)
        );
      };

      extraConfig = ''
          animations {
            enabled = true

            bezier = wind, 0.05, 0.9, 0.1, 1.05
            bezier = winIn, 0.1, 1.1, 0.1, 1.1
            bezier = winOut, 0.3, -0.3, 0, 1
            bezier = liner, 1, 1, 1, 1

            animation = windows, 1, 6, wind, slide
            animation = windowsIn, 1, 6, winIn, slide
            animation = windowsOut, 1, 5, winOut, slide
            animation = windowsMove, 1, 5, wind, slide
            animation = border, 1, 1, liner
            animation = borderangle, 1, 30, liner, loop
            animation = fade, 1, 10, default
            animation = workspaces, 1, 5, wind
        }
      '';
    };
  };
}
