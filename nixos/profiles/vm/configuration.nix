{ pkgs, ... }:
{
    imports = 
    [
        ../../configuration.nix
        ../../system/grub-bootloader.nix
        ./hostname.nix
        ./hardware-configuration.nix
        ../../system/mountsamba.nix
        ../../system/dm/sddm.nix
        ../../system/wm/plasma6.nix
    ];

    #services.desktopManager.cosmic.enable = true;
    #services.displayManager.cosmic-greeter.enable = true;

    boot.kernelPackages = pkgs.linuxPackages_zen; 

    boot.loader.grub.device = "/dev/vda";

    environment.systemPackages = with pkgs; [
        protonup-qt
    ];
}
