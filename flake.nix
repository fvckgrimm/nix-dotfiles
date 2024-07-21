{

  description = "My first flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    my-pkgs.url = "path:./pkgs";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, catppuccin, nixvim, home-manager, nixos-hardware, my-pkgs, ...}@inputs:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (final: prev: import my-pkgs { pkgs = final; })
        ];
      };
      #pkgs = nixpkgs.legacyPackages.${system};

    in {
    nixosConfigurations = {
      desolate = lib.nixosSystem {
        inherit system;
        modules = [ 
	  ./hosts/desolate/configuration.nix
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.apple-macbook-pro-14-1
        ];
      };
    };
    homeConfigurations = {
      grimm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	extraSpecialArgs = { inherit inputs; };
	modules = [ 
	  ./hosts/desolate/home.nix 
	  catppuccin.homeManagerModules.catppuccin
	  nixvim.homeManagerModules.nixvim
	];
      };
    };
  };

}
