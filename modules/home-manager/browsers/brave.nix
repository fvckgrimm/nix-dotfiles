{pkgs, ...}: 

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    # commandLineArgs = [
    #   "--disable-gpu-driver-bug-workarounds"
    #   "--use-gl=egl"
    #   "--ignore-gpu-blocklist"
    #   "--enable-gpu-rasterization"
    #   "--enable-zero-copy"
    #   "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder,CanvasOopRasterization,UseOzonePlatform"
    #   "--disable-features=UseChromeOSDirectVideoDecoder"
    #   "--ozone-platform=wayland"

    #   "--enable-media-router"
    #   "--enable-smooth-scrolling"
    # ];
    extensions = [
      # Ublock Origin
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
      # Bitwarden
      {id = "nngceckbapebfimnlniiiahkandclblb";}
      # Darkreader
      {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";}
      # Vimium
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";}
      # Unhook - Clean YT
      {id = "khncfooichmfjbepaaaebmommgaepoid";}
      # nightTab
      {id = "hdpcadigjkbcpnlcpbcohpafiaefanki";}
      # webrecorder
      {id = "fpeoodllldobpkbkabpblcfaogecpndd";}
    ];
  };
}
