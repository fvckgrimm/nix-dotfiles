{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    wezterm
    curlie
    brave
    chromium
    imhex
    ani-cli
    httpie
    xfce.thunar
    logseq
    sublime
    vesktop
    vscodium
    stremio
    qbittorrent
    transmission
    insomnia
    yt-dlp
    ffmpeg
  ];

}
