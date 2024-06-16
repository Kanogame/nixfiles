{
	home-manager.users.kano = {pkgs, ...}: {
		home.packages = with pkgs; [		
			xdg-desktop-portal-hyprland
			hyprland
			tofi
			waybar
			swww
			swaylock
			pywal
		];

		wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
		"$mod" = "SUPER";

		monitor = ["eDP-1, 1920x1080@144, 0x0, 1"];

		general = {
			gaps_in = 5;
			gaps_out = 10;
			border_size = 2;
			"col.active_border" = "rgb(cdd6f4)";
			"col.inactive_border" = "rgba(595959aa)";
			layout = "dwindle";
		};
		
		input = {
			kb_layout = "us,ru";
			kb_options = "grp:alt_shift_toggle";
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
			mouse_move_focuses_monitor  = true;
			enable_swallow = true;
		};
		
		decoration = {
			rounding = 6;
			active_opacity = 1.0;
			inactive_opacity = 1.0;
			
			blur = {
				enabled = true;
				size = 6;
				passes = 3;
				new_optimizations = true;
				xray = true;
				ignore_opacity = true;
			};

			drop_shadow = true;
			shadow_ignore_window = true;
			shadow_offset = "1 2";
			shadow_range = 20;
			shadow_render_power = 3;
			"col.shadow" = "0x66404040";
		
			blurls = ["waybar" "lockscreen" ];
		};
		
		animations = {
			enabled = true;
			bezier = "wind, 0.05, 0.9, 0.1, 1.05";
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
		"emacs --daemon"
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
			"$mod, J, togglesplit"
			"$mod, F, fullscreen"
			"$mod SHIFT, M, exit"
			#apps
			"$mod, L, exec, swaylock"
			"$mod, E, exec, thunar"
			"$mod, Q, exec, alacritty"
			"$mod, D, exec, emacsclient -c"
			"$mod, SPACE, exec, tofi-drun --drun-launch=true"
			"$mod SHIFT, S, exec, grim -t jpeg -q 80 -g '$(slurp)' - | swappy -f -"
			"$mod, S, exec, grim -t jpeg -q 100 -g '$(slurp)' - | feh -B black -"
			#position	
			"$mod, left, movefocus, l"
			"$mod, right, movefocus, r"
			"$mod, up, movefocus, u"
			"$mod, down, movefocus, d"
			"$mod SHIFT, left, movewindow, l"
			"$mod SHIFT, right, movewindow, r"
			"$mod SHIFT, up, movewindow, u"
			"$mod SHIFT, down, movewindow, d"
		]
		++ (
        		builtins.concatLists (builtins.genList (
            			x: let
              				ws = let
                				c = (x + 1) / 10;
              				in
                				builtins.toString (x + 1 - (c * 10));
            			in [
              				"$mod, ${ws}, workspace, ${toString (x + 1)}"
              				"$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            			]
          		)10)
      		);
		};
	};
};}
