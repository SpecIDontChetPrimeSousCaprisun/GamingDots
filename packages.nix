{ ... }:
{
    imports = [
	./packages/coding.nix	
	./packages/desktop.nix
	./packages/gaming.nix
    ];

    nixpkgs.config.allowUnfree = true;
}
