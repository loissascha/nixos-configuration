{ config, pkgs, ... }:

{
    services.desktopManager.plasma6.enable = true;

    environment.systemPackages = with pkgs; [
        blurredwallpaper
        #xdg-desktop-portal-gtk
        gtk3
        gtk4
        cantarell-fonts
    ];
}
