{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    burpsuite
    dirbuster
    nikto
    ffuf
    mitmproxy
    sqlitebrowser
  ];

}
