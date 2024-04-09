{ config, pkgs, ... }:

{
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = (with pkgs.gnome; [
	    epiphany # gnome web browser
	    geary # email reader
    ]);

    environment.systemPackages = with pkgs; [
        #gtk-engine-murrine
        #gtk_engines
        #gsettings-desktop-schemas
        gnome.gnome-tweaks
        #xfce.thunar
        #pcmanfm
        #cosmic-files 
    ];
}
