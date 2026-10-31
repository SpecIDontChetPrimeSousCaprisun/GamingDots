{ ... }:
{
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub = {
	enable = true;
	device = "nodev";
	efiSupport = true;
	useOSProber = true;
	theme = "/etc/nixos/modules/grub/1440p";
    };
}
