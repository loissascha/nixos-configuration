{ config, pkgs, ... }:

{
    #Grub Bootloader.
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.useOSProber = true;
    boot.loader.grub.configurationLimit = 5;
}