{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
	kitty
	rofi
	librewolf
	pavucontrol
	vesktop
    ];

    programs.zsh.enable = true;
    programs.hyprland = {
	enable = true;
	withUWSM = true;
	xwayland.enable = true;
    };

    xdg.portal = {
	enable = true;
	extraPortals = with pkgs; [
	    xdg-desktop-portal-gtk
	];
    };
}
