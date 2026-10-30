{ inputs, pkgs, config, ... }:
{
    home.username = "chevre";
    home.homeDirectory = "/home/chevre";
    home.stateVersion = "26.05";

    xdg.configFile."hypr".source = ./modules/hypr;
}
