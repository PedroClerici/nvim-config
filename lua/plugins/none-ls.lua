-- https://github.com/nvimtools/none-ls.nvim
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.completion.spell,
      },

      -- Format on save setup
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim https://github.com/nvimtools/none-ls.nvimversion, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
              -- vim.lsp.buf.formatting_sync()
            end,
          })
        end
      end,
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
  end,
}
