{ ... }:

{
  programs = {
    nixvim = {
      keymaps = [
        # Bufferline
        {
            mode = "n";
            key = "<S-l>";
            action = "<cmd>BufferLineCycleNext<cr>";
            options = {
                desc = "Cycle to next buffer";
            };
        }
        {
            mode = "n";
            key = "<S-h>";
            action = "<cmd>BufferLineCyclePrev<cr>";
            options = {
                desc = "Cycle to previous buffer";
            };
        }
        {
            mode = "n";
            key = "<leader>bo";
            action = "<cmd>BufferLineCloseOthers<cr>";
            options = {
                desc = "Delete other buffers";
            };
        }
        {
            mode = "n";
            key = "<leader>br";
            action = "<cmd>BufferLineCloseRight<cr>";
            options = {
                desc = "Delete buffers to the right";
            };
        }
        {
            mode = "n";
            key = "<leader>bl";
            action = "<cmd>BufferLineCloseLeft<cr>";
            options = {
                desc = "Delete buffers to the left";
            };
        }
        {
            mode = "n";
            key = "<leader>bp";
            action = "<cmd>BufferLineTogglePin<cr>";
            options = {
                desc = "Toggle pin";
            };
        }
        {
            mode = "n";
            key = "<leader>bP";
            action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
            options = {
                desc = "Delete non-pinned buffers";
            };
        }

        {
            mode = "n";
            key = "<leader>gg";
            action = "<cmd>LazyGit<CR>";
            options = {
                desc = "LazyGit (root dir)";
            };
        }


        # From Main File:
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


        {
          key = "<leader>lf";
          action = "<cmd>lua require('conform').format({ lsp_fallback = true, async = false, timeout_ms = 500 })<CR>";

          options = {
            silent = true;
          };
        }
        {
          key = ".";
          action = ":";
        }

        {
          key = "<leader>bb";
          action = "<CMD>Telescope file_browser<NL>";
        }

        #{
        #  key = "<leader>t";
        #  action = "<CMD>Neotree<NL>";
        #}

        {
          key = "<leader>w";
          action = "<CMD>WhichKey<NL>";
        }

        {
          key = "<Tab>";
          action = "<CMD>:bnext<NL>";
        }

        {
          key = "<leader>c";
          action = "<CMD>:bp | bd #<NL>";
        }
        {
          key = "<leader>c";
          action = "<CMD>:bp | bd #<NL>";
        }
      ];
    };
  };
}
