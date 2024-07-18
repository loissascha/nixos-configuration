{ config, pkgs, ... }:

{
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = (with pkgs; [
	    epiphany # gnome web browser
	    geary # email reader
    ]);

    environment.systemPackages = with pkgs; [
        #gtk-engine-murrine
        #gtk_engines
        #gsettings-desktop-schemas
        gnome-tweaks
        #xfce.thunar
        #pcmanfm
        #cosmic-files 
    ];
}
