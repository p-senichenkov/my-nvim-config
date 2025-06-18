--[[ Completion and related plugins ]] --
return {
	-- Snippets engine
	{
		'L3MON4D3/LuaSnip',
		-- jsregexp allows "variable" snippets
		build = 'make install_jsregexp',
		lazy = true,
		config = function()
			require('luasnip.loaders.from_lua').load {
				paths = vim.fn.stdpath('config') .. '/lua/snippets'
			}

			local ls = require('luasnip')
			-- Switch to next node on C-L
			vim.keymap.set({ 'i', 's' }, '<C-L>', function()
				ls.jump(1)
			end, { silent = true })
			-- And to previous node on C-J
			vim.keymap.set({ 'i', 's' }, '<C-J>', function()
				ls.jump(-1)
			end, { silent = true })
		end,
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
