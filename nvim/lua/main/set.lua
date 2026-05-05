vim.opt.guicursor = "a:block,i-ci-ve:block-blinkwait700-blinkon400-blinkoff400"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true -- dont ignore case if there's an upper character

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- hyphen should be a part of a word

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

-- Native autocompletion
vim.opt.complete = ".,o" -- use buffer and omnifunc
vim.opt.completeopt = "fuzzy,menuone,noselect,popup" -- add 'popup' for docs (sometimes)
vim.opt.autocomplete = true
vim.opt.shortmess:prepend("c") -- avoid having to press enter on snippet completion
vim.opt.pumheight = 7
