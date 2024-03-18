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

                modules-left = [ "cpu" "memory" "pulseaudio" ];
                modules-center = [ "hyprland/workspaces" ];
                modules-right = [ "tray" "clock" ];

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

                tray = {
                    #"icon-size" = 21;
                    "spacing" = 10;
                };
                clock = {
                    "interval" = 1;
                    "format" = "{:%a %Y-%m-%d %H:%M %p}";
                    "timezone" = "Europe/Berlin";
                    "tooltip-format" = ''
                        <big>{:%Y %B}</big>
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
                background-color: black;
            }

            #workspaces button.active {
                color: #f38ba8;
            }

            #cpu, #memory, #tray, #clock {
                padding: 0 10px;
            }
        '';
    };
}