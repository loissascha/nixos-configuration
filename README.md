## How to install on a fresh system

open your configuration with `sudo nano /etc/nixos/configuration.nix` and add the following lines to enable flakes and add required packages:
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];

environment.systemPackages = with pkgs; [
	git # add git package
];
```

Rebuild your configuration with `sudo nixos-rebuild switch`

create and enter dotfiles directory
```bash
mkdir ~/.dotfiles
cd ~/.dotfiles
```

clone git repo
```git 
git clone https://github.com/loissascha/nixos-configuration.git ./
```

update your system with the flake (select or add the configuration you want).

**be careful to first add your devices hardware configuration (found in /etc/nixos/) to the ~/.dotfiles/nixos/profiles/[profilename] folder**
```bash
sudo nixos-rebuild boot --flake ~/.dotfiles/nixos#saschavm
```

Reboot your system.

### Install Home-Manager (Standalone)

Follow the standalone installation tutorial:

https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone

*It might be necessary to log out and back in before finishing the installation of home-manager.*

After that run the home-manager switch command to build the home manager configuration
```bash 
cd ~/.dotfiles/nixos && home-manager switch --flake .#saschavm
```