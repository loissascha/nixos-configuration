{ config, pkgs, ... }:

{
    home.file.".config/MangoHud/MangoHud.conf".source = ../.config/MangoHud/MangoHud.conf;
}