pkgs: {
    angry-oxide = pkgs.callPackage ./angryoxide {}; 
    SF-Pro = pkgs.callPackage ./SF-Pro {inherit (pkgs) stdenv;};
    sf-mono-powerline = pkgs.callPackage ./sf-mono-powerline {inherit (pkgs) stdenv;};
}
