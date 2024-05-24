{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    clonehero
    osu-lazer-bin
    factorio
    airshipper
    minecraft
    prismlauncher
    ryujinx
    mindustry-wayland
    mindustry
  ];

}
