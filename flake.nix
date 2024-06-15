{

  description = "My first flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
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

  outputs = {self, nixpkgs, catppuccin, nixvim, home-manager, ...}@inputs:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
    nixosConfigurations = {
      desolate = lib.nixosSystem {
        inherit system;
        modules = [ 
	  ./configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
    homeConfigurations = {
      grimm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	extraSpecialArgs = { inherit inputs; };
	modules = [ 
	  ./home.nix 
	  catppuccin.homeManagerModules.catppuccin
	  nixvim.homeManagerModules.nixvim
	];
      };
    };
  };

}
