{ ... }:
{
    imports = 
    [
        ../../configuration.nix
        ../../system/systemd-bootloader.nix
        ./hostname.nix
        ./hardware-configuration.nix
        ../../system/amdgpu.nix
        ../../system/mountsamba.nix
        #../../system/wm/plasma5.nix
        ../../system/wm/plasma6.nix
        #../../system/wm/gnome.nix
        #../../system/wm/hyprland.nix
    ];
}