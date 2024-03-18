{ config, pkgs, ... }:

{
    # SystemD Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}