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
				local config = list.configs[serv]
				if config then
					vim.lsp.config(serv, config)
				end
				vim.lsp.enable(serv)
			end
            for serv in vim.iter(list.disable) do
                vim.lsp.enable(serv, false)
            end
		end,
		-- LSP has built-in laziness support
		lazy = false,
	},
}
