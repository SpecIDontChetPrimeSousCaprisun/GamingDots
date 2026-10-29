{ config, lib, pkgs, ... }:
{
    imports =
	[ 
	    ./hardware-configuration.nix
	    ./users.nix
	    ./bootloader.nix
	    ./kernel.nix
	    ./networking.nix
	    ./locales.nix
	    ./audio.nix
	    ./packages.nix
	];

    services.openssh.enable = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05"; 
    swapDevices = [
	{ device = "/dev/disk/by-uuid/7ed1f481-16e6-4950-bac2-56b10795fcff"; }
    ];
}
