{ inputs, pkgs, config, ... }:
{
    home.username = "chevre";
    home.homeDirectory = "/home/chevre";
    home.stateVersion = "26.05";

    xdg.configFile."hypr".source = ./modules/hypr;
    xdg.configFile."kitty".source = ./modules/kitty;
    xdg.configFile."fastfetch".source = ./modules/fastfetch;

    home.file.".zshrc".source = ./modules/zshrc;
}
