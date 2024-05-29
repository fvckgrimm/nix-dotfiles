{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    eza
    ripgrep
    nitch
    starship
    mprocs
    bat
    speedtest-rs
    du-dust
    zellij
    lazygit
    gitui
    ncspot
    porsmo
    wiki-tui
    tldr
    micro
    fastfetch
    rustdesk
    fd
    broot
    procs
    duf
  ];

}
