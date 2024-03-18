{ config, pkgs, ... }:

{
    home.file.".config/kitty/kitty.conf".source = ../.config/kitty/kitty.conf;
    home.file.".config/alacritty/alacritty.toml".source = ../.config/alacritty/alacritty.toml;
}