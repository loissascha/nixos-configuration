# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  #boot.kernelPackages = pkgs.linuxPackages_latest; 
  boot.kernelPackages = pkgs.linuxPackages_zen;


  # AppImage interpreter
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Virtualisation
  virtualisation.docker.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  #virt manager
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };
  

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "de";
    xkb.variant = "";
  };

  services.flatpak.enable = true;

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.teamviewer.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sascha = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "sascha";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "audio" "video" "libvirtd" ];
  };

  # Allow unfree packages
  nixpkgs = {
    config = {
	    allowUnfree = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    #terminal stuff
    kitty
    fastfetch
    neofetch
    curl
    wget
    vim
    neovim
    wl-clipboard
    wl-clipboard-x11
    btop
    zellij
    du-dust # du command but better
    oh-my-zsh
    tldr
    w3m # terminal web browser
    unzip
    gnome.zenity # zenity
    p7zip # 7z
    psmisc # stuff like killall
    mc # file manager
    yad  # something like zenity i think
    lm_sensors
    wgnord

    # development
    git
    git-lfs # big file storage for git stuff; usage git lfs track
    jetbrains.rider
    jetbrains.phpstorm
    jetbrains.rust-rover
    jetbrains-toolbox
    filezilla
    php
    symfony-cli
    nodejs
    ccls
    gcc
    gdb
    rustup
    cargo
    openjdk
    python3Full
    mono
    dotnet-sdk_8
    vscode
    bruno
    dbeaver
    apostrophe
    termius
    teamviewer
    android-tools

    #work
    teams-for-linux
    slack

    #editors
    notepad-next
    libreoffice

    #settings 
    #xwayland
    xwaylandvideobridge
    gnome.gnome-software
    nerdfonts
    gtk3
    gtk4

    #browsers
    firefox
    brave  
    
    
    #others
    gnome.gnome-calculator
    #insync
    onedrive
    onedrivegui
    remmina
    obs-studio
    gimp
    #distrobox
    cifs-utils
    spotify
    virt-manager
    blender-hip
    vial #qmk keyboard stuff helper
  ];

  environment.shells = with pkgs; [ zsh ];

  programs.zsh = {
	  enable = true;
	  
	  ohMyZsh = {
	    enable = true;
	    plugins = [ "git" ];
	    theme = "agnoster";
	  };
  };


  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpacked
    # programs here, NOT in environment.systemPackages
  ];

  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
