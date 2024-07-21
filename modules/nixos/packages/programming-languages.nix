{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    #redis
    valkey
    php
    phpactor
    tailwindcss
    tailwindcss-language-server
    rpi-imager
    go
    gopls
    rustup
    python3
    pipx
    cargo
    alejandra
    zig
    nim
    nimble
    nimlangserver
    volta
    nodejs_22
    libgcc
    openssl
    binutils_nogold
  ];

}
