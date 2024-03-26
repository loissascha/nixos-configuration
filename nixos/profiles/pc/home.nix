{ config, pkgs, ... }:

let 
  aliases = {
	    update = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#saschapc";
      update-boot = "sudo nixos-rebuild boot --flake ~/.dotfiles/nixos#saschapc";
	    home-update = "cd ~/.dotfiles/nixos && home-manager switch --flake .#saschapc";
      work = "nohup teams-for-linux & disown && nohup slack & disown && nohup flatpak run io.github.mahmoudbahaa.outlook_for_linux & disown";
	    #distrobox = "~/.local/bin/distrobox";
	  };
in
{
  imports = [
    ../../home.nix
    ../../user/zsh.nix
    ../../user/mangohudconf.nix
    ../../user/terminalconfs.nix
    #../../user/wm/hyprland.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.arduino-ide
  ];


  programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
  };

  #home.file.".config/kitty/kitty.conf".text = ''
    #This is Nix created file
  #  confirm_os_window_close 0
  #'';
}
