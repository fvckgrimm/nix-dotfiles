{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    ghidra-bin
    bytecode-viewer
    imhex
    libimobiledevice
  ];

}
