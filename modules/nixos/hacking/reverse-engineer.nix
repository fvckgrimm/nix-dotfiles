{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    ghidra-bin
    apktool
    radare2
    bytecode-viewer
    imhex
    libimobiledevice
  ];

}
