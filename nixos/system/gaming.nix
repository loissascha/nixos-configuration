{ config, pkgs, inputs, ... }:

{
    # Gaming Stuff
    boot.kernel.sysctl = pkgs.lib.mkForce {
        "vm.max_map_count" = 16777216;
        "fs.file-max" = 524288;
    };

    environment.systemPackages = with pkgs; [
        # gaming
        teamspeak_client
        wine
        wine64
        winetricks
        gamemode
        protontricks
        steam-run
        steamtinkerlaunch
        discord-krisp
        lutris
        mangohud
        goverlay
        protonup-qt
        protonup-ng
        xdotool
        xorg.xwininfo
        libstrangle
        xivlauncher
        #inputs.nix-citizen.packages.${system}.star-citizen
    ];

    programs.gamescope.enable = true;
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        #gamescopeSession.enable = true;

        package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
            libkrb5
            keyutils
        ];
        };
        
    };

    programs.java.enable = true;
    programs.gamemode.enable = true;

    #  programs.steam.package = pkgs.steam.override {
#     withPrimus = true;
#     withJava = true;
#  };
}