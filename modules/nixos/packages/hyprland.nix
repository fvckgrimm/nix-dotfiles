{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    dracula-theme
    dracula-icon-theme
    hyprlock
    gpick
    gnome.adwaita-icon-theme
    gnomeExtensions.appindicator
    gnome.gnome-tweaks
    waybar
    swww
    rofi-power-menu
    rofi-wayland
    rofi-emoji
    networkmanagerapplet
    blueman
    bluez
    bluez-tools
    wlr-randr
    nwg-displays
    wlsunset
    wl-clipboard
    cliphist
    wlogout
    grim
    grimblast
    wf-recorder
    slurp
    swappy
    shotman
    lxappearance
    nwg-look
    pavucontrol
    ags
  ];

}
