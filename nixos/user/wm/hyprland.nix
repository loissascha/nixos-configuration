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
                modules-right = [ "tray" "clock" "custom/wlogout" ];

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

                "custom/wlogout" = { 
                    "format" = "  ";
                    "on-click" = "wlogout -c 5 -r 5 -p layer-shell";
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

    home.file.".config/hypr/hyprland.conf".text = ''
autogenerated = 0 # remove this line to remove the warning

# See https://wiki.hyprland.org/Configuring/Monitors/
#monitor=,preferred,auto,auto
#
$leftMonitor = DP-3 
$middleMonitor = DP-2 
$rightMonitor = DP-1 

monitor=$leftMonitor,2560x1440@165,0x0,1     # MSI
monitor=$middleMonitor,2560x1440@240,2560x0,1  #ViewSonic Elite
monitor=$rightMonitor,1920x1080@144,5120x0,1  # Asus 

workspace = 1, monitor:$middleMonitor, default: true
workspace = 2, monitor:$middleMonitor
workspace = 3, monitor:$middleMonitor
workspace = 4, monitor:$middleMonitor
workspace = 5, monitor:$middleMonitor
workspace = 6, monitor:$middleMonitor
workspace = 7, monitor:$middleMonitor
workspace = 8, monitor:$middleMonitor
workspace = 9, monitor:$middleMonitor
workspace = 10, monitor:$middleMonitor
workspace = 11, monitor:$leftMonitor, default: true
workspace = 12, monitor:$leftMonitor 
workspace = 13, monitor:$leftMonitor  
workspace = 14, monitor:$leftMonitor 
workspace = 15, monitor:$leftMonitor 
workspace = 16, monitor:$leftMonitor
workspace = 17, monitor:$leftMonitor
workspace = 18, monitor:$leftMonitor
workspace = 19, monitor:$leftMonitor
workspace = 20, monitor:$leftMonitor
workspace = 21, monitor:$rightMonitor, default: true
workspace = 22, monitor:$rightMonitor
workspace = 23, monitor:$rightMonitor
workspace = 24, monitor:$rightMonitor
workspace = 25, monitor:$rightMonitor
workspace = 26, monitor:$rightMonitor
workspace = 27, monitor:$rightMonitor
workspace = 28, monitor:$rightMonitor
workspace = 29, monitor:$rightMonitor
workspace = 30, monitor:$rightMonitor


# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = xrandr --output $middleMonitor --primary
exec-once = waybar
exec-once = dunst
#exec-once = insync start
exec-once = lxpolkit
exec-once = swww-daemon
#exec-once = swww img $background

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Set programs that you use
$terminal = kitty
$fileManager = pcmanfm
$menu = fuzzel -w 50 -l 40 -b 1e1e2ee6 -s 000000e6 -r 15 -m b4befee6 -C b4befee6 -B 3 

# Some default env vars.
env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = de
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0.3 # -0.4    -1.0 to 1.0, 0 means no modification.
    accel_profile = flat
    #no_warps = true
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 0
    gaps_out = 0
    border_size = 2
    col.active_border = rgba(b4befee6) rgba(b4befee6) 45deg
    col.inactive_border = rgb(11111b)

    layout = dwindle

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 0
    
    blur {
        enabled = true
        size = 3
        passes = 1
    }

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

misc {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device {
    name = epic-mouse-v1
    sensitivity = -0.5
}

# Example windowrule v1
windowrule = tile, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

#windowrule = float, winetricks
#windowrule = float, wine
#windowrule = float, file_progress
#windowrule = float, confirm
#windowrule = float, dialog
#windowrule = move 40% 40%, dialog
#windowrule = float, download
#windowrule = float, notification
#windowrule = float, error
#windowrule = float, splash
#windowrule = float, confirmreset
#windowrule = float, title:Open File
#windowrule = float, title:branchdialog
#windowrule = float, Lxappearance
#windowrule = float, Rofi
#windowrule = animation none,Rofi
#windowrule = float,viewnior
#windowrule = float,feh
#windowrule = float, pavucontrol-qt
#windowrule = float, pavucontrol
#windowrule = float, file-roller

#windowrulev2 = float, class:^(thunar)$, title:^(File Operation Progress)$
#windowrulev2 = float, class:^(thunar)$, title:^(Confirm to replace files)$


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Q, killactive,
bind = $mainMod, Return, exec, $terminal 
bind = $mainMod, L, exit, 
bind = $mainMod, M, exec, pkill waybar ; waybar 
bind = $mainMod, N, exec, hyprctl reload
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating, 
bind = $mainMod, R, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod, F, fullscreen

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Move windows 
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r 
bind = $mainMod SHIFT, up, movewindow, u 
bind = $mainMod SHIFT, down, movewindow, d 

# resize 
bind = $mainMod CTRL, left, resizeactive, -20 0
bind = $mainMod CTRL, right, resizeactive, 20 0
bind = $mainMod CTRL, up, resizeactive, 0 -20
bind = $mainMod CTRL, down, resizeactive, 0 20
bind = $mainMod CTRL SHIFT, left, resizeactive, -80 0
bind = $mainMod CTRL SHIFT, right, resizeactive, 80 0
bind = $mainMod CTRL SHIFT, up, resizeactive, 0 -80
bind = $mainMod CTRL SHIFT, down, resizeactive, 0 80

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

bind = $mainMod CTRL, 1, workspace, 11 
bind = $mainMod CTRL, 2, workspace, 12 
bind = $mainMod CTRL, 3, workspace, 13
bind = $mainMod CTRL, 4, workspace, 14
bind = $mainMod CTRL, 5, workspace, 15
bind = $mainMod CTRL, 6, workspace, 16
bind = $mainMod CTRL, 7, workspace, 17
bind = $mainMod CTRL, 8, workspace, 18
bind = $mainMod CTRL, 9, workspace, 19
bind = $mainMod CTRL, 0, workspace, 20

bind = $mainMod ALT, 1, workspace, 21 
bind = $mainMod ALT, 2, workspace, 22 
bind = $mainMod ALT, 3, workspace, 23
bind = $mainMod ALT, 4, workspace, 24
bind = $mainMod ALT, 5, workspace, 25
bind = $mainMod ALT, 6, workspace, 26
bind = $mainMod ALT, 7, workspace, 27
bind = $mainMod ALT, 8, workspace, 28
bind = $mainMod ALT, 9, workspace, 29
bind = $mainMod ALT, 0, workspace, 30


# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

bind = $mainMod CTRL SHIFT, 1, movetoworkspace, 11
bind = $mainMod CTRL SHIFT, 2, movetoworkspace, 12
bind = $mainMod CTRL SHIFT, 3, movetoworkspace, 13
bind = $mainMod CTRL SHIFT, 4, movetoworkspace, 14
bind = $mainMod CTRL SHIFT, 5, movetoworkspace, 15
bind = $mainMod CTRL SHIFT, 6, movetoworkspace, 16
bind = $mainMod CTRL SHIFT, 7, movetoworkspace, 17
bind = $mainMod CTRL SHIFT, 8, movetoworkspace, 18
bind = $mainMod CTRL SHIFT, 9, movetoworkspace, 19
bind = $mainMod CTRL SHIFT, 0, movetoworkspace, 20

bind = $mainMod ALT SHIFT, 1, movetoworkspace, 21
bind = $mainMod ALT SHIFT, 2, movetoworkspace, 22
bind = $mainMod ALT SHIFT, 3, movetoworkspace, 23
bind = $mainMod ALT SHIFT, 4, movetoworkspace, 24
bind = $mainMod ALT SHIFT, 5, movetoworkspace, 25
bind = $mainMod ALT SHIFT, 6, movetoworkspace, 26
bind = $mainMod ALT SHIFT, 7, movetoworkspace, 27
bind = $mainMod ALT SHIFT, 8, movetoworkspace, 28
bind = $mainMod ALT SHIFT, 9, movetoworkspace, 29
bind = $mainMod ALT SHIFT, 0, movetoworkspace, 30

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, r-1
bind = $mainMod, mouse_up, workspace, r+1
bind = $mainMod SHIFT, mouse_down, movetoworkspace, r-1
bind = $mainMod SHIFT, mouse_up, movetoworkspace, r+1

# Scroll throught existing workspaces with keyboard 
bind = $mainMod ALT, left, workspace, r-1 
bind = $mainMod ALT, right, workspace, r+1
bind = $mainMod ALT SHIFT, left, movetoworkspace, r-1 
bind = $mainMod ALT SHIFT, right, movetoworkspace, r+1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

binde=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bind=, XF86AudioPlay, exec, playerctl play-pause
bind=, XF86AudioPause, exec, playerctl play-pause
bind=, XF86AudioNext, exec, playerctl next
bind=, XF86AudioPrev, exec, playerctl previous
    '';
}