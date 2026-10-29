{ pkgs, ... }:
{
    users.users.chevre = {
	isNormalUser = true;
	extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
	packages = with pkgs; [];
    };
}
