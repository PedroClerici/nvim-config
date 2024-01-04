-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
          ui = {
            border = "rounded",
            icons = {
              package_pending = " ",
              package_installed = "󰄳 ",
              package_uninstalled = " 󰚌",
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
          auto_install = true,
        },
      },
      "hrsh7th/cmp-nvim-lsp",
      -- Optional
      {
        "folke/neodev.nvim",
        opts = {},
      },
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup multiple servers with same default options
      local servers = { "tsserver", "html", "cssls", "emmet_language_server", "lua_ls" }
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
      vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = true,
        float = {
          focusable = false,
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
      })

      -- Function to check if a floating dialog exists and if not then check for diagnostics under the cursor
      function OpenDiagnosticIfNoFloat()
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
          if vim.api.nvim_win_get_config(winid).zindex then
            return
          end
        end

        vim.diagnostic.open_float({
          scope = "line",
          focusable = false,
          close_events = {
            "CursorMoved",
            "CursorMovedI",
            "BufHidden",
            "InsertCharPre",
            "WinLeave",
          },
        })
      end

      -- Show diagnostics under the cursor
      vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        pattern = "*",
        command = "lua OpenDiagnosticIfNoFloat()",
        group = "lsp_diagnostics_hold",
      })

      -- Change lsp signs on signcolumn
      local signs = { Error = "󰅙", Warn = "", Hint = "󰌵", Info = "󰋼" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Makes lsp hover borders round
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
    end,
  },
}
