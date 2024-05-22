{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    go
    rustup
    cargo
    alejandra
    zig
    nim
    volta
  ];

}
