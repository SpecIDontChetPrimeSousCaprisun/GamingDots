{ ... }:
{
    imports = [
	./packages/coding.nix	
	./packages/desktop.nix
	./packages/gaming.nix
	./packages/others.nix
    ];

    nixpkgs.config.allowUnfree = true;
}
