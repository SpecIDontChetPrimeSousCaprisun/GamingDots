{
    description = "gaming flake";
    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	home-manager = {
	    url = "github:nix-community/home-manager/master";
	    inputs.nixpkgs.follows = "nixpkgs";
	};

	drift = {
	    url = "github:socatlolmeow/drift";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    inputs.self.submodules = true;

    outputs = { self, nixpkgs, home-manager, drift, ... }@inputs: {
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
