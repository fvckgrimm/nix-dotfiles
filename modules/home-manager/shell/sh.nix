{config, pkgs, ...}:

{ 

  # Bash
  programs.bash.enable = true;
  programs.bash.shellAliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };
  
  # ZSH
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;

    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      dev = "$HOME/Dev";
      dots = "$HOME/Dev/nixland";
      pics = "$HOME/Pictures";
      vids = "$HOME/Videos";
    };
    dotDir = ".config/zsh";

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "cursor" "regexp" "root" "line"];
    };

    initExtra = ''
      za() {
        if [ -z $1 ]; then
          SELECTION=$(
            zellij list-sessions \
              --no-formatting \
              | awk '{ print $1 }' \
              | gum choose \
                --cursor="▌" \
                --header="Select a session to attach to" \
                --selected="ide" \
                --ordered --select-if-one --cursor.foreground="139"
          )
        else
          SELECTION=$1
        fi

        if [ -z $SELECTION ]; then
          return 0
        fi

        zellij attach "$(echo -e $SELECTION)"
      }
    '';

    shellAliases = {
      # NIX related
      switch-build = "sudo nixos-rebuild switch --flake .#desolate";
      switch-home = "home-manager switch --flake .";
      cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
      listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";

      nnn = "NNN_FIFO=/tmp/nnn.fifo NNN_SPLIT='h' NNN_PLUG='p:preview-tui' nnn";
      search = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim ";
      ls = "eza -L=1 -lhTag";
      zc = "zellij -s";
      #za = "zafunc";
      zl = "zellij ls";
      tree = "eza --tree --icons --tree";
      cd = "z";

      cat = "bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never";
      cp = "cp -iv";
      du = "dust";
      grep= "rg";

      ytmp3 = "yt-dlp --ignore-errors -x --audio-format mp3 -f bestaudio --audio-quality 0 --embed-metadata --embed-thumbnail --output '%(title)s.%(ext)s'";
    }; 

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "urltools" "bgnotify" ];
      theme = "bira";
    };
  };

  # NUSHELL
  #programs.nushell = {
  #  enable = true;
  #  shellAliases = {
  #    nnn = "NNN_FIFO=/tmp/nnn.fifo NNN_SPLIT='h' NNN_PLUG='p:preview-tui' nnn";
  #    search = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim ";
  #    ls = "eza -L=1 -lhTag";
  #    zc = "zellij -s";
  #    za = "zellij a";
  #    zl = "zellij ls";
  #  };
  #};

}
