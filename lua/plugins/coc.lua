local M = {
  "neoclide/coc.nvim",
  branch = "release",
  build = "yarn install --frozen-lockfile",
}

M.config = function()
  -- Some servers have issues with backup files, see #649
  vim.opt.backup = false
  vim.opt.writebackup = false

  -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
  -- delays and poor user experience
  vim.opt.updatetime = 300

  -- Always show the signcolumn, otherwise it would shift the text each time
  -- diagnostics appeared/became resolved
  vim.opt.signcolumn = "yes"

  vim.g.coc_global_extensions = {
    '@yaegassy/coc-nginx',
    'coc-angular',
    'coc-basedpyright',
    'coc-clangd',
    'coc-css',
    'coc-docker',
    'coc-flutter',
    'coc-git',
    'coc-go',
    'coc-html',
    'coc-metals',
    'coc-json',
    'coc-kotlin',
    'coc-lua',
    'coc-qml',
    'coc-r-lsp',
    'coc-react-refactor',
    'coc-sh',
    'coc-sql',
    'coc-swagger',
    'coc-tsserver',
    'coc-vimtex',
    'coc-yaml',
  }

  local isdirectory = vim.fn.isdirectory

  if (isdirectory('./node_modules') ~= 0 and isdirectory('./node_modules/prettier')) then
    table.insert(vim.g.coc_global_extensions, 'coc-prettier')
  end

  if (isdirectory('./node_modules') ~= 0 and isdirectory('./node_modules/eslint')) then
    table.insert(vim.g.coc_global_extensions, 'coc-eslint')
  end


  vim.cmd([[inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]])

  local keyset = vim.keymap.set
  -- Autocomplete
  function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

  -- keyset("n", "gd", "<Plug>(coc-definition)", opts)
  -- keyset("n", "gy", "<Plug>(coc-type-definition)", opts)
  -- keyset("n", "gi", "<Plug>(coc-implementation)", opts)
  -- keyset("n", "gr", "<Plug>(coc-references)", opts)

  vim.cmd([[nmap <silent> gd <Plug>(coc-definition)]])
  vim.cmd([[nmap <silent> gy <Plug>(coc-type-definition)]])
  vim.cmd([[nmap <silent> gi <Plug>(coc-implementation)]])
  vim.cmd([[nmap <silent> gr <Plug>(coc-references)]])

  -- Use K to show documentation in preview window
  function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end

  keyset("n", "K", _G.show_docs, opts)

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  vim.api.nvim_create_augroup("CocGroup", {})
  vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
  })

  vim.cmd([[nmap <silent> <leader>cr <Plug>(coc-rename)]])

  vim.cmd([[nmap <silent> <leader>ca <Plug>(coc-codeaction-cursor)]])

  -- Add `:Format` command to format current buffer
  vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

  vim.cmd([[nmap <silent> <Space>ep <Plug>(coc-diagnostic-prev)]])
  vim.cmd([[nmap <silent> <Space>en <Plug>(coc-diagnostic-next)]])

  vim.cmd([[nmap <silent> <Space>cr <Plug>(coc-rename)]])
  vim.cmd([[nmap <silent> <Space>cs <Plug>(coc-codeaction-cursor)]])
  vim.cmd([[nmap <silent> <Space>cc :CocCommand<CR>]])
  vim.cmd([[xmap <silent> <Space>cc :CocCommand<CR>]])
  vim.cmd([[nmap <silent> <Space>cq :CocCommand fzf-preview.QuickFix<CR>]])
end

return M
