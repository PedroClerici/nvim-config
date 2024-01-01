-- https://github.com/stevearc/oil.nvim
return {
  "stevearc/oil.nvim",
  dependencies = {
    -- Optional
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("oil").setup({
      keymaps = {
        ["<leader>o"] = "actions.close",
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>o", require("oil").toggle_float)
  end,
}
