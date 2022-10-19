-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmp

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
---@cast cmp -?

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end
---@cast luasnip -?

cmp.setup({
	-- Load snippet support
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	-- Completion settings
	completion = {
		keyword_length = 2,
	},

	-- Key mapping
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),

		-- Tab mapping
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},

	-- Window styling
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	-- Load sources, see: https://github.com/topics/nvim-cmp
	sources = {
		-- source current buffer
		{ name = "buffer", keyword_length = 2 },

		-- file paths
		{ name = "path" },

		-- from language server
		{ name = "nvim_lsp", keyword_length = 3 },

		-- display function signatures with current parameter emphasized
		{ name = "nvim_lsp_signature_help" },

		-- complete neovim's Lua runtime API such vim.lsp.
		{ name = "nvim_lua", keyword_length = 2 },

		--
		{ name = "luasnip" },
	},

	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				vsnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})
