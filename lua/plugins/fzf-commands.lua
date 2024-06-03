local M = {
  "hwrnr/nvim-fzf-commands",
  dependencies = {
    "vijaymarupudi/nvim-fzf",
  },
  keys = {
    {"<Space>pf", ":FZFFiles<CR>"},
    {"<Space>p/", ":FZFGrep "},
  },
  command = {
    "FZFFiles",
    "FZFGrep",
  }
}

vim.cmd [[
  command! FZFFiles lua require("fzf-commands").files()
  command! -nargs=1 FZFGrep call luaeval('require("fzf-commands").rg(_A)', <f-args>)
]]

return M

