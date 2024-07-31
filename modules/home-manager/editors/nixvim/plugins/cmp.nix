{ ... }:

{
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
        mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = false })";
            "<Down>" = "cmp.mapping.select_next_item({})";
            "<Up>" = "cmp.mapping.select_prev_item({})";
        };

        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation = {
            border = "rounded";
          };
        };

        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };

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
  programs.nixvim.plugins.cmp-cmdline.enable = false;
}
