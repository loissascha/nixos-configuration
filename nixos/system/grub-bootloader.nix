{ config, pkgs, ... }:

{
    #Grub Bootloader.
    boot.loader.grub.enable = true;
    #boot.loader.grub.device = "/dev/vda";
    boot.loader.grub.useOSProber = true;
    boot.loader.grub.configurationLimit = 5;
}