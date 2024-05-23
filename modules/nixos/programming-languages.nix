{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    go
    rustup
    python3
    cargo
    alejandra
    zig
    nim
    volta
  ];

}
