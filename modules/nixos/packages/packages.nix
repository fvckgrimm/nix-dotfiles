{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    wezterm
    alacritty
    curlie
    brave
    chromium
    ani-cli
    streamlink
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
    bruno
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
    jqp
    rsync
    nuclear
    cryptsetup
  ];

}
