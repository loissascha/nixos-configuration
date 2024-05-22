{ config, pkgs, ... }:

{
    services.xserver.desktopManager.plasma5.enable = true;
    services.displayManager.defaultSession = "plasmawayland";

    environment.systemPackages = with pkgs; [
        
    ];
}
