local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"astro",
		"c",
		"comment",
		"cpp",
		"css",
		"go",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"markdown",
		"lua",
		"python",
		"query",
		"rst",
		"rust",
		"yaml",
		"svelte",
		"tsx",
		"typescript",
		"yaml",
	},

	autotag = { enable = true },

	highlight = {
		-- `false` will disable the whole extension
		enabled = true,
	},

	indent = {
		enabled = true,
	},

	-- List of parsers to ignore install (for "all")
	ignore_install = { "phpdoc", "sql" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = false,
})

local treesitter_install_status, treesitter_install = pcall(require, "nvim-treesitter.install")
if not treesitter_install_status then
	return
end

treesitter_install.compilers = { "gcc", "cc", "cl" }
