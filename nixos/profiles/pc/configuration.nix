{ pkgs, ... }:
{
    imports = 
    [
        ../../configuration.nix
        ../../system/gaming.nix
        ../../system/xwaylandvideobridge.nix
        #../../system/systemd-bootloader.nix
        ../../system/grub-bootloader.nix
        ./hostname.nix
        ./hardware-configuration.nix
        ../../system/amdgpu.nix
        ../../system/mountsamba.nix
        ../../system/dm/gdm.nix
        #../../system/dm/sddm.nix
        #../../system/wm/plasma5.nix
        #../../system/wm/plasma6.nix
        ../../system/wm/gnome.nix
        #../../system/wm/hyprland.nix
    ];

    boot.kernelPackages = pkgs.linuxPackages_cachyos;

    boot.loader.grub.devices = [ "nodev" ];

    #programs.coolercontrol.enable = true;

    environment.sessionVariables = rec {
        PATH = [ "/home/sascha/.dotnet/tools" ];
    };

    programs.dzgui.enable = true;

}
