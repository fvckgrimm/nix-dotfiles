{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    wezterm
    curlie
    brave
    chromium
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
    scrcpy
    android-tools
    fx
    fclones
    fclones-gui
    textsnatcher
    netcat-gnu
    termusic
    neo
    asciiquarium
    toybox
    zip
    unzip
    p7zip
    nettools
    gnumake
    jq
    rsync
    nuclear
  ];

}
