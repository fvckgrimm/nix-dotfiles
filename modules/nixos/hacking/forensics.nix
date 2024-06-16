{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    chkrootkit
    ddrescue
    ddrescueview
    exiv2
    ext4magic
    extundelete
    fcrackzip
    gdb
    pdf-parser
    recoverjpeg
    tcpdump
  ];

}
