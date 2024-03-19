{ ... }:
{
    imports = 
    [
        ../../configuration.nix
        ../../system/grub-bootloader.nix
        ./hostname.nix
        ./hardware-configuration.nix
        ../../system/mountsamba.nix
        ../../system/wm/plasma6.nix
    ];

    boot.loader.grub.device = "/dev/vda";
}
