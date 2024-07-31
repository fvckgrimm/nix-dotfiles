{ pkgs, ... }:
{

  imports = [
    ./nixvim/plugins 
    ./nixvim/core
  ];

  programs.nixvim =
    {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      colorschemes.catppuccin = {
        enable = true;
        settings = {
            flavour = "macchiato"; # mocha, macchiato, frappe, latte
            transparent_background = false;
        };
      };
      opts = {
        expandtab = true;
        shiftwidth = 4;
        smartindent = true;
        tabstop = 4;
        completeopt = "menu,noinsert,preview";
        hidden = true;
        ignorecase = true;
        joinspaces = false;
        scrolloff = 4;
        shiftround = true;
        sidescrolloff = 8;
        smartcase = true;
        splitright = true;
        termguicolors = true;
        wildmode = "list:longest";
        list = true;
        number = true;
        relativenumber = true;
        wrap = true;
        undofile = true;
        clipboard = "unnamedplus";
        cursorcolumn = false;
        spell = true;
      };

      globals = {
        mapleader = " ";
      };

      filetype = {
        pattern = {
          ".*.typ" = "typst";
        };

      };

      plugins = {
        # coq-nvim = {
        #   enable = true;
        #   autoStart = "shut-up";
        #   installArtifacts = true;
        # }; 

        which-key.enable = true;
        nvim-autopairs.enable = true;
        toggleterm.enable = true;
        #toggleterm.extraOptions.close_on_exit = true;

        luasnip.enable = true;
        treesitter = {
          enable = true;
        };
        trouble = {
          enable = true;
        };
        gitsigns = {
          enable = true;
        };
        crates-nvim = {
          enable = true;
        };
        #comment = {
        #  enable = true;
        #};
        fidget = {
          enable = true;
        };
        lualine = {
          enable = true;
        };
        undotree = {
          enable = true;
        };
        neogit = {
          enable = true;
        };
        neorg = {
          enable = false;
        };
        treesitter-context = {
          enable = true;
        };
        telescope = {
          enable = true;
        };
        #rustaceanvim = {
        #  enable = true;
        #};
        lsp-lines = {
          enable = true;
        };
        lspsaga = {
          enable = true;
        };
        leap = {
          enable = true;
        };
        neogen = {
          enable = true;
        };
        wilder = {
          enable = true;
          modes = [ ":" "/" "?" ];
        };
        diffview = {
          enable = true;
        };
        illuminate = {
          enable = true;
        };
        chadtree = {
          enable = true;
        };
        chadtree.view.openDirection = "right";
        #none-ls = {
        #  enable = true;
        #  sources = {
        #    diagnostics = {
        #      # shellcheck.enable = true;
        #      vale.enable = true;
        #      # vulture.enable = true;
        #      alex.enable = true;
        #      gitlint.enable = true;
        #      protolint.enable = true;
        #      # hadolint.enable = true;
        #      # luacheck.enable = true;
        #      mypy.enable = true;
        #      deadnix.enable = true;
        #      # pylint.enable = true;
        #      statix.enable = true;
        #    };
        #    formatting = {
        #      isort.enable = true;
        #      # jq.enable = true;
        #      stylua.enable = true;
        #      markdownlint.enable = true;
        #      prettier.enable = true;
        #      prettier.disableTsServerFormatter = true;
        #      # rustfmt.enable = true;
        #      black.enable = true;
              # sqlfluff.enable = true;
        #       protolint.enable = true;
              # taplo.enable = true;
        #      nixpkgs_fmt.enable = true;
        #      shfmt.enable = true;
        #    };
        #  };
        #};
      };

      extraConfigLua = ''
        vim.diagnostic.config({ virtual_lines = false })

        require("telescope").load_extension("lazygit")

        -- Configuration for UFO folds
        -- require('ufo').setup({
        -- 	provider_selector = function(bufnr, filetype, buftype)
        -- 		return { 'lsp', 'indent' }
        -- 	end
        -- })
        --vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
        --vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })
        --vim.keymap.set('n', 'zK', function()
        --    local winid = require('ufo').peekFoldedLinesUnderCursor()
        --    if not winid then
        --        vim.lsp.buf.hover()
        --    end
        --end, { desc = "Peek Fold" })
      '';

      extraPlugins = with pkgs.vimPlugins; [
        vim-hardtime
      ];
    };
}
# wilder, maximizer, lightbulb, neotest, chadtree, git-conflict, vim-illuminate, lsp_signature

