return {
  "antoinemadec/coc-fzf",
  event = 'VeryLazy',
  enabled = false,
  config = function()
    vim.g.coc_fzf_preview = ''
    vim.g.coc_fzf_opts = {}
  end,
}
