{ config, pkgs, ... }:

{
  # AMD GPU
  #boot.initrd.kernelModules = [ "amdgpu" ];


  #services.xserver.videoDrivers = [ "amdgpu" ]; 


  hardware.opengl = {
    # radv
    driSupport = true;
    driSupport32Bit = true;

    # amdvlk
    #extraPackages = with pkgs; [ rocmPackages.clr.icd amdvlk ];
    #extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };

  environment.systemPackages = with pkgs; [
    #radeon-profile
  ];

}
