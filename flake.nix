{
  description = "drMosocovium's Nix Config";

  inputs = {

		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  	home-manager = {
	   	url = github:nix-community/home-manager;
	   	inputs.nixpkgs.follows = "nixpkgs";
		};

		neovim.url = "github:nix-community/neovim-nightly-overlay";
		emacs-overlay.url = "github:nix-community/emacs-overlay";
		hyprland.url = "github:hyprwm/Hyprland";
		eww.url = "github:elkowar/eww";

  };

  outputs = { self, nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem{
			  inherit system;
			  modules = [ 
				./users
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.drmoscovium = {
						imports = [ ./users/drmoscovium/home.nix ];
					};
				}
			];	
		};	
	  };
  };
}
