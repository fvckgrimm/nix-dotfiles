{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    go
    rustup
    python3
    pipx
    cargo
    alejandra
    zig
    nim
    volta
    nodejs_22
    libgcc
  ];

}
