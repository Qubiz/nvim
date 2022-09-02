-- Color scheme
vim.g.sonokai_style = "andromeda"
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_better_performance = 1

local colorscheme = "sonokai"

require("lualine").setup {
    options = {
        theme = "sonokai"
    }
}

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	return
end
