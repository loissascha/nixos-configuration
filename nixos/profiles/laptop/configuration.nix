{ ... }:
{
    imports = 
    [
        ../../configuration.nix
        ../../system/systemd-bootloader.nix
        ./hostname.nix
        ./hardware-configuration.nix
        ../../system/mountsamba.nix
        ../../system/wm/gnome.nix
    ];
}