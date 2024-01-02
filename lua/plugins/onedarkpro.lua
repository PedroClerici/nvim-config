-- https://github.com/olimorris/onedarkpro.nvim
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      options = {
        transparency = true,
        terminal_colors = true,
      },
    })

    vim.cmd.colorscheme("onedark_dark")
    vim.cmd("highlight PmenuThumb guibg=fg")
  end,
}
