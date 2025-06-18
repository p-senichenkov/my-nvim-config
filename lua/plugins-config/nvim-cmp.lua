local cmp = require('cmp')
local lspkind = require('lspkind')
local win_config = require('util/config/float')

cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},

	-- Icons-related settings. See https://github.com/onsails/lspkind.nvim
	formatting = {
		fields = { 'abbr', 'kind' },
		format = lspkind.cmp_format {
			-- Only symbol, no text
			mode = 'symbol',
			-- Official VS Code icons. Individual symbols can be overriden with symbol_map
			preset = 'codicons',
			symbol_map = {
				Function = "󰊕",
			},
			maxwidth = {
				-- Actual suggestion item
				abbr = 35,
			},
		},
	},

	window = {
		completion = cmp.config.window.bordered(win_config),
		documentation = cmp.config.window.bordered(win_config),
	},

	preselect = cmp.PreselectMode.None,

	mapping = cmp.mapping.preset.insert {
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		-- <Enter> confirms only if explicilty selected, ...
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		-- ...<Tab> always
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
	},

	sources = cmp.config.sources {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		-- TODO: there's a lot of other sources
	},

	experimental = {
		-- Enable "Visual Studio 3000 Professional Plus"-like preview
		ghost_text = { hl_group = 'GhostText' },
	},

	enabled = function()
		local disabled = false

		-- Disable in Nvim prompts
		disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
		-- Disable when recording or executing macros
		disabled = disabled or (vim.fn.reg_recording() ~= '')
		disabled = disabled or (vim.fn.reg_executing() ~= '')
		-- Disable in comments
		disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')

		return not disabled
	end
}

cmp.setup.filetype('tex', {
	sources = cmp.config.sources({
		{ name = 'vimtex' },
	})
})

--[[ LSP ]] --
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for serv in require('util/config/lsp-list').iter do
	require('lspconfig')[serv].setup {
		capabilities = capabilities,
	}
end
