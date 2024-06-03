local M = {
  "preservim/nerdcommenter",
  config = function()
    vim.g.NERDCreateDefaultMappings = true
    vim.g.NERDSpaceDelims = true
    vim.g.NERDCommentEmptyLines = false
    vim.g.NERDDefaultAlign = "left"
    vim.g.NERDTrimTrailingWhitespace = true
    vim.g.NERDToggleCheckAllLines = true
    vim.g.NERDRemoveExtraSpaces = true
  end,
  keys = {
    { "<Space>cl", "<cmd>call nerdcommenter#Comment('', 'toggle')<CR>", mode={"n"}, desc="Comment code", {noremap = true, silent = true}},
    { "<Space>cl", ":call nerdcommenter#Comment('x', 'toggle')<CR>", mode={"x"}, desc="Comment code", {noremap = true, silent = true}},
  }
}

return M
