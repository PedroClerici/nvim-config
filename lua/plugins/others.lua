return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "VidocqH/auto-indent.nvim",
    config = function()
      require("auto-indent").setup({
        lightmode = true,
        indentexpr = function(lnum)
          return require("nvim-treesitter.indent").get_indent(lnum)
        end,
      })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "ja-ford/delaytrain.nvim",
    config = function()
      require("delaytrain").setup({
        grace_period = 3,
      })
    end,
  },
  { "tpope/vim-surround" },
  { "mg979/vim-visual-multi" },
  { "ThePrimeagen/vim-be-good" },
}
