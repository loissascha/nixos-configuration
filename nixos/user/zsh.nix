{ config, pkgs, ... }:

{
    programs.zsh = {
    enable = true;
    shellAliases = {
	    vim = "nvim";
	    du = "dust";
	    gc = "git commit -m";
	    ll = "ls -lah";
	    config = "cd ~/.dotfiles/nixos && vim configuration.nix";
	    flake-update = "cd ~/.dotfiles/nixos && nix flake update";
	    multi = "zellij";
	    runRider = "nix-shell ~/.dotfiles/nix/shells/dotnet.nix --run 'nohup rider &'";
		runRover = "nix-shell ~/.dotfiles/nix/shells/rust.nix --run 'nohup rust-rover &'";
	    dotnet-shell = "nix-shell ~/.dotfiles/nix/shells/dotnet.nix --run zsh";
	    java17-shell = "nix-shell ~/.dotfiles/nix/shells/java17.nix --run zsh";
		java8-shell = "nix-shell ~/.dotfiles/nix/shells/java8.nix --run zsh";
      	rust-shell = "nix-shell ~/.dotfiles/nix/shells/rust.nix --run zsh";
	  	electron-shell = "nix-shell ~/.dotfiles/nix/shells/electron28.nix --run zsh";
	    shells = "	echo -e 'runRider \t\t-> \t\tdotnet shell + start Rider without console' && 
					echo -e 'runRover \t\t-> \t\trust shell + start Rust Rover without console' && 
					echo -e 'runGodot \t\t-> \t\tStart Godot 4.2.2 if available' &&  
					echo -e 'dotnet-shell \t\t-> \t\tdotnet shell (6, 7, 8)' && 
					echo -e 'java17-shell \t\t-> \t\tjava17 shell for minecraft' && 
					echo -e 'java8-shell \t\t-> \t\tjava8 shell for minecraft' && 
					echo -e 'rust-shell \t\t-> \t\trust development shell' && 
					echo -e 'electron-shell \t\t-> \t\telectron 28 development shell'";
	  };
    initExtra = "
	fastfetch
	";
  };
}
