{ pkgs, ... }:
{
    fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
    ];

    environment.systemPackages = with pkgs; [
	kitty
	rofi
	librewolf
	pavucontrol
	vesktop
	fastfetch
	awww
	quickshell
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
