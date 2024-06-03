return {
  'dart-lang/dart-vim-plugin',
  ft = {'dart'},
  config = function ()
    vim.g.dart_style = 'pedantic'
  end,
}
