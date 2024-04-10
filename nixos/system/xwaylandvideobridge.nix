{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        xwaylandvideobridge
    ];
}