pkgs: {
    angry-oxide = pkgs.callPackage ./angryoxide {}; 
    SF-Pro = pkgs.callPackage ./SF-Pro {inherit (pkgs) stdenv;};
}
