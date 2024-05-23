{config, pkgs, ...}:

{

  # stole these from https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles/ 
  imports = [
    ./firewall.nix
    #./mac-randomize.nix
    ./info-fetchers.nix
    ./virtualisation.nix
    #./usb.nix
    #./security-services.nix
    #./clamav-scanner.nix
  ];

}
