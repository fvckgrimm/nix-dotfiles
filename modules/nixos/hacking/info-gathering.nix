{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    exiftool
    ike-scan
    wireshark
    nmap
    rustscan
    angry-oxide
#netexec - add later on manually 
    urlhunter
    masscan
    etherape
    bettercap
    ettercap
    sherlock
    uncover
    nuclei
    smbmap
  ];

}
