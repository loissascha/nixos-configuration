{ config, lib, pkgs, modulesPath, ...  }:

{
	fileSystems."/mnt/samba100" = {
		device = "//192.168.0.50/samba100";
		fsType = "cifs";
		options = let
		automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,guest";
		in ["${automount_opts},uid=1000,gid=1000"];
    };
}
