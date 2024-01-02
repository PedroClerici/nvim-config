return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        lazy = false,
        dependencies = {
          "rafamadriz/friendly-snippets",
          "saadparwaiz1/cmp_luasnip",
        },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        lazy = false,
        config = true,
      },
    },
    lazy = false,
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-k>"] = function()
            if cmp.visible() then
              cmp.close()
            else
              -- If we find a floating window, close it.
              local found_float = false
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                if vim.api.nvim_win_get_config(win).relative ~= "" then
                  vim.api.nvim_win_close(win, true)
                  found_float = true
                end
              end
              cmp.complete()
            end
          end,

          -- Luasnip
          ["<Tab>"] = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
            { name = "buffer" },
          }),
      })
    end,
  },
}
