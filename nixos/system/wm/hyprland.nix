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
        dunst
        playerctl
        swww
        nwg-look
        #gvfs # needed for thunar 
        #xdg-desktop-portal-gtk
        pcmanfm
    ];
}
