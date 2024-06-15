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
<<<<<<< HEAD
    #rustdesk
=======
    rustdesk
>>>>>>> df95a740e007c03e6bbbc961ebbb99cc5a74d610
    fd
    broot
    procs
    duf
  ];

}
