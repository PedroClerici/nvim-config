-- https://github.com/olimorris/onedarkpro.nvim
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      options = {
        transparency = true,
      },
    })

    vim.cmd.colorscheme("onedark_dark")
    vim.cmd("highlight PmenuSel guibg=#181818")
  end,
}
