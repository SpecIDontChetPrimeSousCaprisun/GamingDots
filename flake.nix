{
    description = "gaming flake";
    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	home-manager = {
	    url = "github:nix-community/home-manager/master";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
	nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
	    specialArgs = { inherit inputs; };
	    modules = [
		./configuration.nix
		home-manager.nixosModules.home-manager {
		    home-manager.useGlobalPkgs = true;
		    home-manager.useUserPackages = true;
		    home-manager.users.chevre = import ./home.nix;
		    home-manager.extraSpecialArgs = {
			inherit inputs;
		    };

		    home-manager.backupFileExtension = "bak";
		}
	    ];
	};
    };
}
