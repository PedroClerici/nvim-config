-- https://github.com/lukas-reineke/indent-blankline.nvim
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-indentscope.md
return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    { "echasnovski/mini.indentscope" },
  },
  config = function()
    require("ibl").setup({
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = { filetypes = { "mason", "lazy" } },
    })
    require("mini.indentscope").setup({
      symbol = "│",
    })

    vim.cmd("highlight IndentBlankLineContextChar guifg=#e5c07b")
    vim.opt.list = true
  end,
}
