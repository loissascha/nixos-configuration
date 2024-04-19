{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";

    home-manager = {
       url = "github:nix-community/home-manager/master";
       inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-cosmic, chaotic, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = { 
        saschapc = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [ 
              chaotic.nixosModules.default
              ./profiles/pc/configuration.nix
            ];
        };
        saschalaptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            chaotic.nixosModules.default
            ./profiles/laptop/configuration.nix
          ];
        };
        saschavm = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
            }
            nixos-cosmic.nixosModules.default
            chaotic.nixosModules.default
            ./profiles/vm/configuration.nix
          ];
        };
      };

      homeConfigurations = {
	      saschapc = home-manager.lib.homeManagerConfiguration {
	        inherit pkgs;
	        modules = [ 
            ./profiles/pc/home.nix 
          ];
	      };
        saschalaptop = home-manager.lib.homeManagerConfiguration {
	        inherit pkgs;
	        modules = [ 
            ./profiles/laptop/home.nix 
          ];
	      };
	      saschavm = home-manager.lib.homeManagerConfiguration {
	        inherit pkgs;
	        modules = [ 
            ./profiles/vm/home.nix 
          ];
	      };
      };

    };
}
