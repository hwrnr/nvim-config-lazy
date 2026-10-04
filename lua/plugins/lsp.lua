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
					"cssls",
					"emmet_ls",
					"eslint",
					"html",
					"jsonls",
					"tailwindcss",
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
				ts_ls = {
					settings = {
						typescript = {
							tsserver = {
								-- Forces tsserver to check errors across all project files on startup
								watchOptions = {
									watchFile = "DynamicPriorityPolling",
								},
							},
						},
						javascript = {
							tsserver = {
								watchOptions = {
									watchFile = "DynamicPriorityPolling",
								},
							},
						},
					},
				},
				html = {},
				cssls = {},
				emmet_ls = {},
				jsonls = {},
				yamlls = {},
				bashls = {},
				dockerls = {},
				gopls = {},
				clangd = {},
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = {
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
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
		},

		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				}),

				sources = {
					{
						name = "nvim_lsp",
						entry_filter = function(entry, ctx)
							-- 15 is the internal LSP code for "Snippet"
							if entry:get_kind() == 15 then
								return false
							end
							return true
						end,
					},
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
}
