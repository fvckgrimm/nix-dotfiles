{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    onionshare-gui
    onionshare
    tor
    tor-browser
    mullvad-browser
  ];

}
