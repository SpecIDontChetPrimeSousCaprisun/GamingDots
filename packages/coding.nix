{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
	neovim 
	git
	tmux 
	libnotify
	ripgrep
    ];
}
