-- https://github.com/echasnovski/mini.statusline
return {
  "echasnovski/mini.statusline",
  dependencies = {
    -- Optional
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("mini.statusline").setup()
  end,
}
