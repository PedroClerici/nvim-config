-- https://github.com/luukvbaal/statuscol.nvim
return {
  "luukvbaal/statuscol.nvim",
  config = function()
    require("statuscol").setup({
      relculright = true,
    })
  end,
}
