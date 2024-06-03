local M = {
  "scrooloose/nerdtree",
  config = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeWinPos = "right"
  end,
  cmd = "NERDTreeToggle",
  keys = {
    {"<F3>", "<cmd>NERDTreeToggle<CR>", {noremap = true, silent = true}},
  },
  dependencies = {
    "Xuyuanp/nerdtree-git-plugin",
  }
}

-- This can't be in the config function because it needs to be set before for some reason
vim.g.NERDTreeMapActivateNode='l'

return M

