{
  home-manager.users.kano = { pkgs, ... }: {
    services = {
      blueman-applet.enable = true;
      network-manager-applet.enable = true;
    };

    programs.waybar = {
      enable = true;
      # package = inputs.waybar.packages."${pkgs.system}".waybar;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          spacing = 0;
          "margin-top" = 0;
          "margin-left" = 0;
          "margin-right" = 0;
          height = 44;
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "cpu" "mem" "disk" ];
          modules-right =
            [ "tray" "battery" "clock" ];

          "wlr/taskbar" = {
            format = "{icon}";
            "on-click" = "activate";
            "on-click-right" = "fullscreen";

            "icon-size" = 25;
            "tooltip-format" = "{title}";
          };
          "hyprland/window" = {
            "format" = "{title:30}";
            "max-length" = 30;
            "separate-outputs" = true;
          };

          "hyprland/workspaces" = {
            "active-only" = false;
            "all-outputs" = true;
            "disable-scroll" = false;
            "on-scroll-up" = "hyprctl dispatch workspace -1";
            "on-scroll-down" = "hyprctl dispatch workspace +1";
            "format" = "{icon}";
            "on-click" = "activate";
            "format-icons" = {
              "1" = "一";
              "2" = "二";
              "3" = "三";
              "4" = "四";
              "5" = "五";
              "6" = "六";
              "7" = "七";
              "8" = "八";
              "9" = "九";
              "10" = "十";
              "urgent" = "";
              "active" = "";
              "default" = "󰧞";
              "sort-by-number" = true;
            };
          };

          tray = { spacing = 16; };

          clock = {
            "tooltip-format" = "<tt>{calendar}</tt>";
            "format-alt" = "  {:%a, %d %b %Y}";
            format = "󰥔  {:%I:%M %p}";
          };

          pulseaudio = {
            format = "{icon}";
            "format-bluetooth" = "󰂰";
            nospacing = 1;
            "tooltip-format" = "Volume : {volume}%";
            "format-muted" = "󰝟";
            "format-icons" = {
              "headphone" = "";
              "default" = [ "󰖀" "󰕾" "" ];
            };
            "on-click" = "pamixer -t";
            "scroll-step" = 1;
          };

          "custom/logo" = {
            format = "  ";
            tooltip = false;
            on-click = "menu";
          };

          mem = {
            "format" = "󰍛 {}%";
            "format-alt" = "󰍛 {used}/{total} GiB";
            "interval" = 5;
          };

          cpu = {
            "format" = "󰻠 {usage}%";
            "format-alt" = "󰻠 {avg_frequency} GHz";
            "interval" = 5;
          };

          disk = {
            "format" = "󰋊 {}%";
            "format-alt" = "󰋊 {used}/{total} GiB";
            "interval" = 5;
            "path" = "/";
          };

          battery = {
            format = "{capacity}% {icon}";
            "format-icons" = {
              "charging" = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
              "default" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            };
            "format-full" = "󰁹 ";
            interval = 10;
            states = {
              warning = 20;
              critical = 10;
            };
            tooltip = false;
          };
        };
      };
      style = ''
            @import '/home/kano/.cache/wal/colors-waybar.css';

        * {
            border: none;
            border-radius: 0px;
            font-family: "FiraMono Nerd Font Mono";
            font-size: 14px;
            font-style: normal;
            min-height: 0;
        }

        window#waybar {
            background: rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid @background;
            color: @color15
        }

        #workspaces, #tray {
        	background: @background;
        	margin: 5px 5px 5px 5px;
        	padding: 0px 5px 0px 5px;
        	border-radius: 16px;
          	border: solid 0px #cdd6f4;
          	font-weight: normal;
          	font-style: normal;
        }
        #workspaces button {
            padding: 0px 5px;
            border-radius: 16px;
            color: @color13;
        }

        #workspaces button.active {
            color: @color15;
            background-color: transparent;
            border-radius: 16px;
        }

        #workspaces button:hover {
        	background-color: #E6B9C6;
        	color: black;
        	border-radius: 16px;
        }

        #custom-date, #clock, #battery, #pulseaudio, #network, #custom-randwall, #custom-launcher {
        	background: transparent;
        	padding: 5px 5px 5px 5px;
        	margin: 5px 5px 5px 5px;
          	border-radius: 8px;
          	border: solid 0px #cdd6f4;
        }

        #custom-date {
        	color: @color15;
        }

        #clock {
            	color: @color15;
            	background-color: @background;
            	border-radius: 0px 0px 0px 24px;
            	padding-left: 13px;
            	padding-right: 15px;
            	margin-right: 0px;
            	margin-left: 10px;
            	margin-top: 0px;
            	margin-bottom: 0px;
            	font-weight: bold;
        }

        #pulseaudio {
            	color: @color15;
            	border-radius: 8px;
            	margin-left: 0px;
        }

        #pulseaudio.muted {
            	background: transparent;
            	color: #928374;
            	border-radius: 8px;
            	margin-left: 0px;
        }

        #custom-playerlabel {
            background: transparent;
            padding-left: 10px;
            padding-right: 15px;
            border-radius: 16px;
            margin-top: 5px;
            margin-bottom: 5px;
            font-weight: normal;
            font-style: normal;
        }

        #cpu, #custom-gpu1usage, #custom-gpu2usage, #custom-weather, #mem, #disk {
            background-color: @background;
            border-radius: 16px;
            margin: 5px;
            margin-left: 5px;
            margin-right: 5px;
            padding: 0px 10px 0px 10px;
            font-weight: bold;
        }

              @keyframes blink {
                to {
                  background-color: #f38ba8;
                  color: #181825;
                }
              }

              #battery.warning,
              #battery.critical,
              #battery.urgent {
                background-color: #ff0048;
                color: #181825;
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
              }

        /*      #battery.charging {
                background-color: };
                color: ;
                animation: none;
              }
        */
              #custom-power {
                color: @color15;
              }
      '';
    };
  };
}
