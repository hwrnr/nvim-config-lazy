vim.cmd [[set termguicolors]]

return {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      css = true
    })
  end,
}
