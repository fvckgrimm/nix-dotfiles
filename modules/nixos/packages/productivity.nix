{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    libreoffice
    onlyoffice-bin
  ];

}
