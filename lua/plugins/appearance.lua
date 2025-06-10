--[[ Packages that change appearance (not related utilities) ]] --
return {
	-- Indentation guides
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			-- One-quarter bar is too thick for me. Use one-eight one
			indent = { char = "▏" },
		},
		-- config = true,
	},

	-- Bottom panel
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = require('plugins-config/lualine'),
	},

	-- Customizable left column
	{
		'luukvbaal/statuscol.nvim',
		lazy = false,
		config = function()
			require('plugins-config/statuscol')
		end,
	},

	--[[ Themes ]] --
	-- OneDark
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('plugins-config/onedark')
		end,
	},
}
