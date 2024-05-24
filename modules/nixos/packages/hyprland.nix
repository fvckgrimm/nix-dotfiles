{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    waybar
    swww
    rofi-power-menu
    rofi-wayland
    rofi-emoji
    networkmanagerapplet
    wlr-randr
    nwg-displays
    wlsunset
    wl-clipboard
    grim
    grimblast
    slurp
    swappy
    shotman
  ];

}
