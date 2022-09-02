vim.opt.backup = false

vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

vim.opt.undofile = true -- enables persisten undo

-- Tabs
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.softtabstop = 4 -- number of spaces that <Tab> uses while editing
vim.opt.smartindent = true
vim.opt.wrap = false

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.cmdheight = 1 -- Give more space for displaying messages

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.

vim.opt.hlsearch = true -- highlight all matches on previous search pattern

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})
