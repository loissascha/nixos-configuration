{ config, pkgs, ... }:

{
    # TODO needs device set in the per device configuration.nix file
    
    #Grub Bootloader.
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.useOSProber = true;
    boot.loader.grub.configurationLimit = 5;
}