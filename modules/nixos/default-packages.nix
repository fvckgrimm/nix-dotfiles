{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    kitty
    neovim
    vim
    git
    curl
    wget
    neofetch
    libnotify
    dunst
    fzf
    zsh
    oh-my-zsh
    magic-wormhole
    gallery-dl
    nnn
    pass
    mpv
    localsend
    wireguard-tools
    mullvad-vpn
    ranger
    librewolf
    thunderbird
    opensnitch
    catppuccin-gtk
    catppuccin-sddm-corners
  ];

}
