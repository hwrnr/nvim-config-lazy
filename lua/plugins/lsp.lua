return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			vim.opt.backup = false
			vim.opt.writebackup = false
			vim.opt.updatetime = 300
			vim.opt.signcolumn = "yes"

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"basedpyright",
					"bashls",
					"clangd",
					"cssls",
					"dockerls",
					"eslint",
					"gopls",
					"html",
					"jdtls",
					"jsonls",
					"lua_ls",
					"marksman",
					"qmlls",
					"sqls",
					"stylua",
					"tailwindcss",
					"texlab",
					"ts_ls",
					"yamlls",
				},
			})

			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
				end

				map("n", "K", vim.lsp.buf.hover)

				map("n", "<Space>cr", vim.lsp.buf.rename)

				map("n", "<Space>en", vim.diagnostic.goto_next)
				map("n", "<Space>ep", vim.diagnostic.goto_prev)

				map("n", "<Space>bf", function()
					vim.lsp.buf.format({ async = true })
				end)
			end

			local servers = {
				ts_ls = {},
				html = {},
				cssls = {},
				jsonls = {},
				yamlls = {},
				bashls = {},
				dockerls = {},
				gopls = {},
				clangd = {},
				basedpyright = {},
				sqls = {},
				tailwindcss = {},
				eslint = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
						},
					},
				},
			}

			for name, cfg in pairs(servers) do
				vim.lsp.config(
					name,
					vim.tbl_deep_extend("force", cfg, {
						on_attach = on_attach,
					})
				)
				vim.lsp.enable(name)
			end
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},

		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				}),

				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "luasnip" },
				},
			})
		end,
	},
}
