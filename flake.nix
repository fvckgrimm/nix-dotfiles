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
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, catppuccin, nixvim, home-manager, nixos-hardware, ...}@inputs:
    let 
        inherit (self) outputs;
        lib = nixpkgs.lib;
        systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
        forAllSystems = nixpkgs.lib.genAttrs systems;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

    in {

        packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
        overlays = import ./overlays {inherit inputs;};

        nixosConfigurations = {
          desolate = lib.nixosSystem {
            #inherit system;
            specialArgs = {inherit inputs outputs;};
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
	        extraSpecialArgs = { inherit inputs outputs; };
	        modules = [ 
	          ./hosts/desolate/home.nix 
	          catppuccin.homeManagerModules.catppuccin
	          nixvim.homeManagerModules.nixvim
	        ];
          };
        };
    };

}
