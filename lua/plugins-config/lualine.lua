local onedark_custom = require('lualine.themes.onedark')

onedark_custom.normal.c = { bg = 'bg' }
onedark_custom.inactive.c = { bg = 'bg' }

require('lualine').setup {
	options = {
		theme = onedark_custom,
	},

	-- Different behaviour for specific filetypes
	extensions = {
		'neo-tree',
	},

	-- [a b c    x y z]
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
}
