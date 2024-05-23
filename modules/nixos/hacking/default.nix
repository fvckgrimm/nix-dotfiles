{config, pkgs, ...}:

{

  imports = [
    ./cryptography.nix
    ./exploitation.nix
    ./dns-gathering.nix
    ./info-gathering.nix
    ./webapp-analysis.nix
    ./reverse-engineer.nix
    ./privacy.nix
  ];

}
