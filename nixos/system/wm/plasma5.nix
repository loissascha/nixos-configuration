{ config, pkgs, ... }:

{
    services.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
    services.xserver.displayManager.defaultSession = "plasmawayland";

    environment.systemPackages = with pkgs; [
        
    ];
}
