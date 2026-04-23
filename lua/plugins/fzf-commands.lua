return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<Space>pf",
				function()
					require("fzf-lua").files()
				end,
				desc = "List all files",
			},

			{
				"<Space>p/",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live grep",
			},

			{
				"<Space>ee",
				function()
					require("fzf-lua").diagnostics_workspace()
				end,
				desc = "Workspace diagnostics",
			},

			{
				"gd",
				function()
					require("fzf-lua").lsp_definitions()
				end,
				desc = "Go to definition",
			},

			{
				"gi",
				function()
					require("fzf-lua").lsp_implementations()
				end,
				desc = "Go to implementation",
			},

			{
				"gr",
				function()
					require("fzf-lua").lsp_references()
				end,
				desc = "Find references",
			},

			{
				"<Space>cs",
				function()
					require("fzf-lua").lsp_code_actions()
				end,
				mode = { "n", "v" },
				desc = "Code actions",
			},

			{
				"<Space>cc",
				function()
					require("fzf-lua").commands()
				end,
				desc = "Command palette",
			},
		},

		config = function()
			require("fzf-lua").setup({
				winopts = {
					height = 0.85,
					width = 0.80,
					preview = {
						layout = "horizontal",
					},
				},
				fzf_colors = {
					true,
					-- main UI
					["fg"] = { "fg", "Normal" },
					["bg"] = { "bg", "Normal" },

					-- prompt
					["hl"] = { "fg", "Statement" },
					["fg+"] = { "fg", "CursorLine" },
					["bg+"] = { "bg", "CursorLine" },

					-- selection
					["hl+"] = { "fg", "Identifier" },

					-- gutter / numbers
					["info"] = { "fg", "Comment" },
					["border"] = { "fg", "FloatBorder" },
					["gutter"] = { "bg", "Normal" },

					-- prompt line
					["prompt"] = { "fg", "Function" },
					["pointer"] = { "fg", "Keyword" },
					["marker"] = { "fg", "Keyword" },
					["spinner"] = { "fg", "Type" },
					["header"] = { "fg", "Comment" },
				},

				fzf_opts = {
					["--layout"] = "reverse",
				},
			})
		end,
	},
}
