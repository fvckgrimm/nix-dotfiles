pkgs: {
    angry-oxide = pkgs.callPackage ./angry-oxide {}; 
    SF-Pro = pkgs.callPackage ./SF-Pro {inherit (pkgs) stdenv;};
}
