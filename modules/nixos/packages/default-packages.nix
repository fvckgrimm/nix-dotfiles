{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    mbpfan
    stow
    qutebrowser
    kitty
    ueberzugpp
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
    openvpn
    ranger
    librewolf
    thunderbird
    opensnitch
    opensnitch-ui
    catppuccin-gtk
    catppuccin-sddm-corners
    pika-backup
  ];

}
