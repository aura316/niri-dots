vim.pack.add({
	"https://github.com/folke/conform.nvim",
})

-- Setup https://github.com/stevearc/conform.nvim#setup
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
