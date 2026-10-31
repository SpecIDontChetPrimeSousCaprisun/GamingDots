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
}
