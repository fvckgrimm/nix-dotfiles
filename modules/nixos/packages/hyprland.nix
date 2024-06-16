{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    waybar
    swww
    rofi-power-menu
    rofi-wayland
    rofi-emoji
    networkmanagerapplet
    blueman
    wlr-randr
    nwg-displays
    wlsunset
    wl-clipboard
    cliphist
    wlogout
    grim
    grimblast
    slurp
    swappy
    shotman
    lxappearance
    nwg-look
    pavucontrol
  ];

}
