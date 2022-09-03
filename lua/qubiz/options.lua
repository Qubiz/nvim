-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)
local fn = vim.fn -- Functions

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- Show line number
opt.relativenumber = true -- Show relative numbers
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.colorcolumn = "120" -- Line length marker
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.wrap = false -- Wrap lines when they do not fit the screen

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 700 -- ms to wait for trigger an event

-----------------------------------------------------------
-- Shell
-----------------------------------------------------------
-- Windows specific settings
--[[ This is currently disabled, because this creates some issues with the file watcher used by nvim-tree...
if fn.has("win32") == 1 then
	if fn.executable("pwsh") == 0 then
		print("[nvim] PowerShell Core >= v6 is required on Windows!")

		return
	end

	local pwsh_flags = {
		"-NoLogo",
		"-NoProfile",
		"-ExecutionPolicy",
		"RemoteSigned",
		"-Command",
		"[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	}

	opt.shellcmdflag = table.concat(pwsh_flags, " ")
	opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	opt.shell = "pwsh"
	opt.shellquote = ""
	opt.shellxquote = ""
end
]]
-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append("sI")

-- -- Disable builtin plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end
