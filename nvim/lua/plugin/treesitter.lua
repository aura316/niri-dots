vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		build = function()
			vim.cmd("TSUpdate")
		end,
	},
})

require("nvim-treesitter").install({ "lua" })
