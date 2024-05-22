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
    enableAutosuggestions = true;
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

    shellAliases = {
      # NIX related
      switch-build = "sudo nixos-rebuild switch --flake .";
      switch-home = "home-manager switch --flake .";
      cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
      listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";

      nnn = "NNN_FIFO=/tmp/nnn.fifo NNN_SPLIT='h' NNN_PLUG='p:preview-tui' nnn";
      search = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim ";
      ls = "eza -L=1 -lhTag";
      zc = "zellij -s";
      za = "zellij a";
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
