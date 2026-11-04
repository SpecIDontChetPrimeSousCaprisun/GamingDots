{ pkgs, ... }: 
{
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;
    hardware.amdgpu.overdrive.enable = true;
    services.flatpak.enable = true;

    environment.systemPackages = with pkgs; [
	mangohud
	prismlauncher
    ];
}
