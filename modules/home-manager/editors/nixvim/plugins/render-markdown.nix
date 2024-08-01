{ pkgs, ... }:
let
    version = "5.0.0";
in 
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
        pname = "markdown.nvim";
        version = version;
        src = pkgs.fetchFromGitHub {
            owner = "MeanderingProgrammer";
            repo = "markdown.nvim";
            rev = "v${version}";
            hash = "sha256-LJ+QzAZejj6E0lwlq1vlo9Y4sCzPVWfWojPwj584f1U=";
        };
     })
    ];
  };
}
