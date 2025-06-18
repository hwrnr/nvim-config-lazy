return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  enabled = true,
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'alpha', 'lazy' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { { 'filename', file_status = true, path = 1 } },

        lualine_x = { 'diagnostics' },
        lualine_y = { 'encoding', 'fileformat', 'filetype', 'g:coc_status' },
        lualine_z = { 'searchcount', 'location', 'selectioncount' },
      },
      tabline = {
        lualine_a = { 'buffers' },
      },
      extensions = { 'nerdtree', 'lazy' }
    }
  end,
}
