{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    #keymaps.lspBuf = {
    #  "<leader>fm" = "format";
    #};
    servers = {
        tsserver.enable = true;
        nil-ls = {
            enable = true;
        };
        pylsp = {
            enable = true;
            settings = {
            plugins = {
                autopep8.enabled = false;
                black.enabled = false;
                flake8.enabled = false;
                mccabe.enabled = false;
                memestra.enabled = false;
                pycodestyle.enabled = false;
                pydocstyle.enabled = false;
                isort.enabled = false;
                pyflakes.enabled = false;
                pylint.enabled = false;
                pylsp_mypy.enabled = false;
                yapf.enabled = false;
            };
            };
        };
        ruff-lsp = {
            enable = true;

        };

        nixd = {
            enable = true; # k
        };
        lua-ls = {
            enable = true;
        };
        bashls = {
            enable = true;
        };
        gopls = {
            enable = true;
            autostart = true;
            cmd = ["gopls"];
            filetypes = ["go" "gomod" "gowork" "gotmpl"];
        };
        nimls = {
            enable = true;
            autostart = true;
            cmd = ["nimlangserver"];
            filetypes = ["nim"];
        };
        #marksman = {
        #  enable = true;
        #};
        #gleam = {
        #  enable = true;  
        #};
        phpactor = { 
            enable = true;
            autostart = true;
            cmd = ["phpactor" "language-server"];
            filetypes = ["php"];
        };
        tailwindcss = {
            enable = true;
            autostart = true;
            cmd = ["tailwindcss-language-server"];
            filetypes = ["html" "css" "tsx" "tmpl" "php" "svelte"];
        };
        };
  };
}
