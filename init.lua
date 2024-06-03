local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "<space>" -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.cmd([[set number relativenumber]])
vim.cmd([[set cursorline]])
vim.cmd([[set mouse=a]])

vim.cmd([[map <Space>bn :bnext<CR>]])
vim.cmd([[map <Space>bp :bprevious<CR>]])
vim.cmd([[map <Space>bc :bdelete<CR>]])

vim.cmd([[nnoremap sg :vsplit<CR>]])
vim.cmd([[nnoremap sh :split<CR>]])

vim.cmd([[nnoremap <Space>j <C-W><C-J>]])
vim.cmd([[nnoremap <Space>k <C-W><C-K>]])
vim.cmd([[nnoremap <Space>l <C-W><C-L>]])
vim.cmd([[nnoremap <Space>h <C-W><C-H>]])

vim.cmd([[nnoremap <CR> :noh<CR><CR>]])

vim.cmd([[set nowrap]])

require("lazy").setup("plugins")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
