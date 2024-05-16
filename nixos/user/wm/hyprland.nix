{ config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 35;
                margin = "0";
                spacing = 2;

                modules-left = [ "cpu" "memory" "pulseaudio" "wlr/taskbar" "hyprland/window" ];
                modules-center = [ "hyprland/workspaces" ];
                modules-right = [ "tray" "custom/swaync" "clock" "custom/wlogout" ];

                "hyprland/workspaces" = {
                    "format" = "{icon}";
                    "format-icons" = {
                        "1" = "󱚌 (1)";
                        "2" = "󰖟 (2)";
                        "3" = " (3)";
                        "4" = "󰎄 (4)";
                        "5" = "󰋩 (5)";
                        "6" = " (6)";
                        "7" = "󰄖 (7)";
                        "8" = "󰑴 (8)";
                        "9" = "󱎓 (9)";
                    };
                    "on-click" = "activate";
                    "on-scroll-up" = "hyprctl dispatch workspace e-1";
                    "on-scroll-down" = "hyprctl dispatch workspace e+1";
                    #"all-outputs" = true;
                    #"active-only" = true;
                    #"show-special" = false;
                    #"persistent-workspaces" = {
                    #    # this block doesn't seem to work for whatever reason
                    #    "eDP-1" = [1 2 3 4 5 6 7 8 9];
                    #    "DP-1" = [1 2 3 4 5 6 7 8 9];
                    #    "HDMI-A-1" = [1 2 3 4 5 6 7 8 9];
                    #    "1" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "2" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "3" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "4" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "5" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "6" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "7" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "8" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #    "9" = ["eDP-1" "DP-1" "HDMI-A-1"];
                    #};
                };

                "wlr/taskbar" = {
                    "format" = "{icon}";
                    "icon-size" = 14;
                    #"icon-theme" = "ePapirus-Dark";
                    #"tooltip-format" = "{title}";
                    "on-click" = "activate";
                    "on-click-middle" = "close";
                    #"ignore-list" = [
                    #    "Alacritty"
                    #];
                    #"app_ids-mapping" = {
                    #    "firefoxdeveloperedition": "firefox-developer-edition"
                    #};
                    #"rewrite": {
                    #    "Firefox Web Browser": "Firefox",
                    #    "Foot Server": "Terminal"
                    #}
                };

                "custom/wlogout" = { 
                    "format" = "";
                    "on-click" = "wlogout -c 5 -r 5 -p layer-shell";
                    #"class" = "wlogout";
                };

                "custom/swaync" = {
                    "format" = "";
                    "on-click" = "sleep 0.1 && swaync-client -op";
                };

                tray = {
                    #"icon-size" = 21;
                    "spacing" = 8;
                };
                clock = {
                    "interval" = 1;
                    "format" = "{:%H:%M %p}";
                    "timezone" = "Europe/Berlin";
                    "tooltip-format" = ''
                        <big>{:%a %Y %B %d}</big>
                        <tt><small>{calendar}</small></tt>'';
                };
                cpu = { "format" = "{usage}% "; };
                memory = { "format" = "{}% "; };
                pulseaudio = {
                    "scroll-step" = 1;
                    "format" = "{volume}% {icon}  {format_source}";
                    "format-bluetooth" = "{volume}% {icon}  {format_source}";
                    "format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
                    "format-muted" = "󰸈 {format_source}";
                    "format-source" = "{volume}% ";
                    "format-source-muted" = " ";
                    "format-icons" = {
                        "headphone" = "";
                        "hands-free" = "";
                        "headset" = "";
                        "phone" = "";
                        "portable" = "";
                        "car" = "";
                        "default" = [ "" "" "" ];
                    };
                    "on-click" = "pavucontrol";
                };
            };
        };
        style = ''
            window#waybar {
                background-color: #1e1e2e;
            }

            #cpu {
                background:#eba0ac;
                color: #000000;
            }

            #memory {
                color: #000000;
                background: #cba6f7;
            }

            #pulseaudio {
                color: #000000;
                background:#f9e2af;
            }

            #tray {
                color: #000000;
                background:#313244;
            }

            #clock {
                color: #000000;
                background: #cba6f7;
            }

            #custom-wlogout {
                color: #000000;
                background: #f38ba8;
                padding-left: 10px;
                padding-right: 14px;
                border-radius:8px;
            }

            #custom-swaync {
                color: #000000;
                background: #f9e2af;
                padding-left: 10px;
                padding-right: 14px;
                border-radius:8px;
            }

            #window {
                color: #cdd6f4;
                background: #313244;
            }

            #workspaces button {
                color: #b4befe;
            }

            #workspaces button.active {
                color: #000000;
                background: #b4befe;
            }

            #cpu, #memory, #tray, #clock, #pulseaudio, #window {
                padding: 0 10px;
                border-radius:8px;
            }
        '';
    };

    home.file.".config/hypr/hyprland.conf".source = ../../.config/hypr/hyprland.conf;
}