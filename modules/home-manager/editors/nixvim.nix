{ pkgs, ... }:
{
  programs.nixvim =
    {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      colorschemes.catppuccin.enable = true;
      #colorschemes.catppuccin.settings = {
      #  transparent_background = false;
      #};
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

      keymaps =
        [
          {
            key = "//";
            action = ":noh<CR>";
          }
          {
            key = "<C-h>";
            action = "<cmd>lua require('luasnip').jump(1)<CR>";
          }
          {
            key = "<leader>ff";
            action = "<cmd>lua require('telescope.builtin').find_files()<CR>";
          }
          {
            key = "<leader>fg";
            action = "<cmd>lua require('telescope.builtin').live_grep()<CR>";
          }
          {
            key = "<leader>gs";
            action = ":Neogit<CR>";
          }
          {
            key = "<leader>af";
            action = "<cmd> lua vim.lsp.buf.format()<CR>";
          }
          {
            key = "<leader>ac";
            action = ":Neogen<CR>";
          }
          {
            key = "<leader>m";
            action = ":MaximizerToggle<CR>";
          }
          {
            key = "<leader>t";
            action = ":CHADopen<CR>";
          }
          {
            key = "<leader>l";
            action = "<cmd> lua require('lsp_lines').toggle()<CR>";
          }
          {
            key = "<leader>jd";
            action = "<cmd> lua vim.lsp.buf.definition() <CR>";
          }
          {
            key = "<leader>jr";
            action = "<cmd>Lspsaga finder<CR>";
          }
          {
            key = "<leader>rs";
            action = "<cmd>Lspsaga rename<CR>";
          }
          {
            key = "<leader>ca";
            action = "<cmd>Lspsaga code_action<CR>";
          }
          {
            key = "<F4>";
            action = "<cmd>ToggleTerm<CR>";
          }
        ];

      plugins = {
        # coq-nvim = {
        #   enable = true;
        #   autoStart = "shut-up";
        #   installArtifacts = true;
        # };
        cmp = {
          enable = true;
          settings = {
            mapping = {
              "<CR>" = "cmp.mapping.confirm({ select = false })";
              "<Down>" = "cmp.mapping.select_next_item({})";
              "<Up>" = "cmp.mapping.select_prev_item({})";
            };

            snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

            sources = [
              { name = "path"; }
              { name = "nvim_lsp"; }
              { name = "luasnip"; }
              {
                name = "buffer";
                option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              }
            ];
          };
        };

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
        lsp = {
          enable = true;
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
      '';
      extraPlugins = with pkgs.vimPlugins; [
        vim-hardtime
      ];
    };
}
# wilder, maximizer, lightbulb, neotest, chadtree, git-conflict, vim-illuminate, lsp_signature

