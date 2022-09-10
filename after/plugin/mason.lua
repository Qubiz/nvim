local status, mason = pcall(require, "mason")
if not status then
	return
end

local mason_lspconfig_status, mason_lsponfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

mason.setup({})
mason_lsponfig.setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"tsserver",
		"svelte",
		"kotlin_language_server",
		"tailwindcss",
	},
})
