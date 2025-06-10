--[[ LSP related plugins ]] --
return {
	-- All kinds of "find"
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		event = 'LspAttach',
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			-- Small floating window to show LSP status (dunno where it is used)
			-- 'j-hui/fidget.nvim',
		},
		config = function()
			-- Enable servers
			local list = require('util/config/lsp-list')
			for serv in list.iter do
				-- Note braces here. We pass empty table. It's not the same as `setup()`, which passes `nil`
				local config = list.configs[serv]
				if config then
					require('lspconfig')[serv].setup(config)
				else
					require('lspconfig')[serv].setup {}
				end
			end
		end,
		-- LSP has built-in laziness support
		lazy = false,
	},
}
