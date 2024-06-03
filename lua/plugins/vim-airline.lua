local M = {
  "vim-airline/vim-airline",
  dependencies = { "vim-airline/vim-airline-themes" },
}

M.config = function()
  if vim.g.airline_symbols == nil then
    vim.g.airline_symbols = { }
  end

  vim.cmd([[let g:airline#extensions#tabline#enabled = 1]])
  vim.cmd([[let g:airline#extensions#tabline#left_sep = ' ']])
  vim.cmd([[let g:airline#extensions#tabline#left_alt_sep = ' ']])
  vim.cmd([[let g:airline_left_sep = '']])
  vim.cmd([[let g:airline_left_alt_sep = '']])
  vim.cmd([[let g:airline_right_sep = '']])
  vim.cmd([[let g:airline_right_alt_sep = '']])
  vim.cmd([[let g:airline_symbols.branch = '']])
  vim.cmd([[let g:airline_symbols.readonly = '']])
  vim.cmd([[let g:airline_symbols.linenr = ' ']])
  vim.cmd([[let g:airline_symbols.maxlinenr = ' ']])
  vim.cmd([[let g:airline_symbols.dirty='⚡']])

  vim.g.airline_theme = "base16_gruvbox_dark_soft"
end

return M
