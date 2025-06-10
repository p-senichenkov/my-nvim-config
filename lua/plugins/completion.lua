--[[ Completion and related plugins ]] --
return {
	-- Snippets engine
	{
		'L3MON4D3/LuaSnip',
		-- jsregexp allows "variable" snippets
		build = 'make install_jsregexp',
		lazy = true,
	},

	-- Completion itself
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippets engine (it's obligatory)
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- LSP
			'hrsh7th/cmp-nvim-lsp',

			-- Icons
			'onsails/lspkind.nvim',

			-- Calc source
			'hrsh7th/cmp-calc',

			'neovim/nvim-lspconfig',
		},
		-- Just before entering Insert mode (also applies to Replace)
		-- event = 'InsertEnter',
		config = function()
			require('plugins-config/nvim-cmp')
		end,
		-- Completion somehow doesn't work with LSP with lazy load
		lazy = false,
	},
}
