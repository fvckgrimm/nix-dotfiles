{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    onionshare-gui
    onionshare
  ];

}
