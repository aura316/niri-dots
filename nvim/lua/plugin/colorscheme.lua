vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/rebelot/kanagawa.nvim",
})

require("tokyonight").setup({
	style = "night",
	transparent = false,
})

require("kanagawa").setup({
	transparent = false,
	theme = "wave",
})

-- setup must be called before loading
vim.cmd.colorscheme("kanagawa")
