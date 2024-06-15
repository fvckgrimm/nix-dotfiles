{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
<<<<<<< HEAD
    mbpfan
=======
>>>>>>> df95a740e007c03e6bbbc961ebbb99cc5a74d610
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
    openvpn
    ranger
    librewolf
    thunderbird
    opensnitch
    catppuccin-gtk
    catppuccin-sddm-corners
    pika-backup
  ];

}
