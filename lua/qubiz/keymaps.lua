-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

local dap = require("dap")
local dapui = require("dapui")

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Disabled
-- Disable arrow keys
keymap("", "<up>", "<nop>")
keymap("", "<down>", "<nop>")
keymap("", "<left>", "<nop>")
keymap("", "<right>", "<nop>")

-- Normal --
-- Better window navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Format
keymap("n", "<leader>fmt", ":Neoformat<CR>", opts)

-- Debugger
keymap("n", "<Home>", function()
	dapui.open({})
end)
keymap("n", "<End>", function()
	dapui.close({})
end)
keymap("n", "<leader>b", function()
	dap.toggle_breakpoint()
end)
keymap("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
keymap("n", "<F9>", function()
	dap.continue()
end)
keymap("n", "<Up>", function()
	dap.continue()
end)
keymap("n", "<Down>", function()
	dap.step_over()
end)
keymap("n", "<Right>", function()
	dap.step_into()
end)
keymap("n", "<Left>", function()
	dap.step_out()
end)
keymap("n", "<leader>rc", function()
	dap.run_to_cursor()
end)
