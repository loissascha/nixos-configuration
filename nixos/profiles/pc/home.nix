{ config, pkgs, ... }:

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
    shellAliases = {
	    update = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#saschapc";
	    home-update = "cd ~/.dotfiles/nixos && home-manager switch --flake .#saschapc";
	    #distrobox = "~/.local/bin/distrobox";
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
	    update = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#saschapc";
	    home-update = "cd ~/.dotfiles/nixos && home-manager switch --flake .#saschapc";
	    #distrobox = "~/.local/bin/distrobox";
	  };
  };

  #home.file.".config/kitty/kitty.conf".text = ''
    #This is Nix created file
  #  confirm_os_window_close 0
  #'';
}
