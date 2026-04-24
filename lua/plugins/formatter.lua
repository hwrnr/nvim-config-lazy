local M = {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				["*"] = { "prettier" },
			},
		})

		vim.api.nvim_create_user_command("Format", function()
			require("conform").format({ async = true })
		end, {})
	end,
	keys = {
		{
			"<Space>bf>",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format current buffer",
		},
	},
}

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		local buf = args.buf
		if vim.bo[buf].filetype == "" then
			return
		end

		require("conform").format({
			bufnr = buf,
			lsp_fallback = true,
		})
	end,
})

return M
