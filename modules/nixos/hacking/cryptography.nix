{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    cyberchef
    binwalk
    gpa
    sirikali
  ];

}
