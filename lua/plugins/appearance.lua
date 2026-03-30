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
		config = function(_, opts)
			local hooks = require('ibl.hooks')
			local hl = require('util.config.colors')

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, 'IblScope', hl.misc['IblScope'])
			end)

			require('ibl').setup(opts)
		end
	},

	-- Bottom panel
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('plugins-config.lualine')
		end
	},

	-- Customizable left column
	{
		'luukvbaal/statuscol.nvim',
		lazy = false,
		config = function()
			require('plugins-config/statuscol')
		end,
	},

    -- Customizable right column
    {
        'lewis6991/satellite.nvim',
        lazy = false,
        opts = {
            current_only = false,
            width = 1,
            winblend = 60,
            handlers = {
                cursor = { enable = false },
                diagnostic = {
                    signs = { '󰌶', '󰀪', '󰅚' },
                },
                marks = { enable = false },
                quickfix = { enable = false },
            }
        }
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
