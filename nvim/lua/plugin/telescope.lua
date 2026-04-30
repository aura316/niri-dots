vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    -- extension
    "https://github.com/nvim-telescope/telescope-ui-select.nvim"
})

require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
})

require("telescope").load_extension("ui-select")
