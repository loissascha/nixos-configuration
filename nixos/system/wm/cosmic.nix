{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        #cosmic-epoch
        cosmic-applets
        cosmic-applibrary
        cosmic-bg
        cosmic-comp
        cosmic-icons
        cosmic-launcher
        cosmic-notifications
        cosmic-osd
        cosmic-panel
        cosmic-session
        cosmic-settings
        cosmic-settings-daemon
        cosmic-workspaces-epoch
        xdg-desktop-portal-cosmic
        cosmic-greeter
        cosmic-text
        libcosmic
        cosmic-protocols
        cosmic-time
        cosmic-edit
        cosmic-screenshot
        cosmic-design-demo
        cosmic-term
        cosmic-randr 
        cosmic-files 
    ];
}
