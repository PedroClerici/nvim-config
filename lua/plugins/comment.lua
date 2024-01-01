-- https://github.com/numToStr/Comment.nvim
return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup()

    -- Keymaps
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end)
    vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
  end,
}
