{ config, pkgs, ... }:

{
  imports = [
    ../../home.nix
    ../../user/zsh.nix
    ../../user/mangohudconf.nix
    ../../user/terminalconfs.nix
  ];

  home.packages = [
    #pkgs.arduino-ide

  ];


  programs.bash = {
    enable = true;
    shellAliases = {
	    update = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#saschavm";
	    home-update = "cd ~/.dotfiles/nixos && home-manager switch --flake .#saschavm";
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
	    update = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#saschavm";
	    home-update = "cd ~/.dotfiles/nixos && home-manager switch --flake .#saschavm";
	  };
  };
 
}
