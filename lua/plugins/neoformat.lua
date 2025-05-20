local M = {
  "sbdchd/neoformat",
  cmd = "Neoformat",
  config = function()
    vim.g.neoformat_enabled_python = { "black" }
    vim.g.neoformat_enabled_lua = { "luaformat" }
    vim.g.neoformat_enabled_javascript = { "prettier" }
    vim.g.neoformat_enabled_typescript = { "prettier" }
    vim.g.neoformat_enabled_go = { "gofmt" }
    vim.g.neoformat_enabled_rust = { "rustfmt" }
    vim.g.neoformat_enabled_cpp = { "clangformat" }
    vim.g.neoformat_enabled_c = { "clangformat" }
    vim.g.neoformat_enabled_cmake = { "cmake_format" }
    vim.g.neoformat_enabled_shell = { "shfmt" }
    vim.g.neoformat_enabled_yaml = { "prettier" }
    vim.g.neoformat_enabled_json = { "prettier" }
    vim.g.neoformat_enabled_markdown = { "prettier" }
    vim.g.neoformat_enabled_toml = { "prettier" }
    vim.g.neoformat_enabled_dockerfile = { "prettier" }
    vim.g.neoformat_enabled_html = { "prettier" }
    vim.g.neoformat_enabled_css = { "prettier" }
    vim.g.neoformat_enabled_scss = { "prettier" }
    vim.g.neoformat_enabled_sass = { "prettier" }
    vim.g.neoformat_enabled_less = { "prettier" }
    vim.g.neoformat_enabled_php = { "prettier" }
    vim.g.neoformat_enabled_ruby = { "prettier" }
    vim.g.neoformat_enabled_vim = { "prettier" }
    vim.g.neoformat_enabled_terraform = { "terraform_fmt" }
    vim.g.neoformat_enabled_hcl = { "terraform_fmt" }
    vim.g.neoformat_enabled_xml = { "prettier" }
    vim.g.neoformat_enabled_sql = { "sqlformat" }
    vim.g.neoformat_enabled_scala = { "scalafmt" }
    vim.g.neoformat_enabled_java = { "google-java-format" }
    vim.g.neoformat_enabled_kotlin = { "ktlint" }
    vim.g.neoformat_enabled_zig = { "zigfmt" }
    vim.g.neoformat_enabled_nix = { "nixfmt" }
  end,
  keys = {
    { "<space>bf", "<cmd>Neoformat<CR>", desc = "Format current buffer (Neoformat)", { noremap = true, silent = true } },
  },
}

-- TODO: Add keybding
-- Following isn't working
vim.keymap.set("n", "<leader>bf", "<cmd>Neoformat<CR>", { noremap = true, silent = true })
vim.keymap.set("x", "<leader>bf", "<cmd>Neoformat<CR>", { noremap = true, silent = true })

return M
