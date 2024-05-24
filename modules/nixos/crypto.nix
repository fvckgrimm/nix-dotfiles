{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    wasabiwallet
    monero-gui
    # xmrig
    exodus
  ];

}
