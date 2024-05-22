{ config, pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        #lxappearance
        #xfce.thunar
        #waybar
        lxde.lxsession
        pavucontrol
        fuzzel
        #dunst
        swaynotificationcenter
        playerctl
        swww
        nwg-look
        #gvfs # needed for thunar 
        #xdg-desktop-portal-gtk
        pcmanfm
        wlogout
        slurp
        grim
        wl-clipboard
        swappy
    ];
}
