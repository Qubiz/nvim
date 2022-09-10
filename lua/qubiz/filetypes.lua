vim.filetype.add({
	extension = {
		svelte = "svelte",
	},
})

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, { pattern = { "*.svelte" }, command = "TSBufEnable highlight" })
