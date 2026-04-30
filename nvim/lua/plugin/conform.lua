vim.pack.add({
	"https://github.com/folke/conform.nvim",
})

-- Setup https://github.com/stevearc/conform.nvim#setup
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
