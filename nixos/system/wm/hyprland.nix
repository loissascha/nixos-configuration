{ config, pkgs, ... }:

{
    services.xserver.displayManager.sddm.enable = true;
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        lxappearance
        #xfce.thunar
        #waybar
        lxde.lxsession
        pavucontrol
        fuzzel
        dunst
        playerctl
        gvfs # needed for thunar 
        xdg-desktop-portal-gtk
        pcmanfm
    ];
}
