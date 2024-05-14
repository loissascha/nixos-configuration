{ config, pkgs, ... }:

{
  environment.etc = {
    environment = {
        text = ''
            CLUTTER_DEFAULT_FPS=240
            __GL_SYNC_DISPLAY_DEVICE=DP-2
            __GL_SYNC_TO_VBLANK=0
        '';
        mode = "0440";
    };
  };
}
