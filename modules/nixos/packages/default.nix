{config, pkgs, ...}:

{

  imports = [
    ./games.nix
    ./crypto.nix
    ./packages.nix
    ./hyprland.nix
    ./alternatives.nix
    ./default-packages.nix
    ./programming-languages.nix
  ];

}
