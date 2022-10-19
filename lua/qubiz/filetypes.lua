vim.filetype.add({
    extension = {
        svelte = "svelte",
        astro = "astro",
    },
})

local autocmd = vim.api.nvim_create_autocmd

autocmd(
    { "BufRead", "BufEnter", "BufWinEnter", "BufNewFile" },
    { pattern = { "*.svelte" }, command = "TSBufEnable highlight" }
)
autocmd(
    { "BufRead", "BufEnter", "BufWinEnter", "BufNewFile" },
    { pattern = { "*.astro" }, command = "TSBufEnable highlight" }
)
