local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- A list of parser names, or "all"
	ensure_installed = "all",

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		-- `false` will disable the whole extension
		enabled = true,

		-- List of languages that will be disabled
		disable = {},
	},

	indent = {
		enabled = true,
		disable = {},
	},
})

local treesitter_install_status, treesitter_install = pcall(require, "nvim-treesitter.install")
if not treesitter_install_status then
	return
end

treesitter_install.compilers = { "gcc", "cc", "cl" }
