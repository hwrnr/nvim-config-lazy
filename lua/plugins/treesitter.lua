local M = {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "python", "typescript", "json", "yaml", "css", "scss", "tsx", "graphql", "jsonc", "rust", "ruby", "go", "java", "php", "bash", "dockerfile", "hcl", "lua", "yaml", "comment" },
      auto_install = true,
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

return { M }
