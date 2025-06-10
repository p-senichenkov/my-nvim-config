local global_colors = require('util/config/colors')

-- Theme-specific colors
local local_colors = {
	bg0 = '#000015',
}

require('onedark').setup {
	style = 'darker',

	code_style = {
		keywords = 'bold',
	},

	-- 'force' means "on conflict select rightmost"
	colors = vim.tbl_extend('force', global_colors.colors, local_colors),
	-- colors = global_colors.colors,

	highlights = global_colors.highlights,

	diagnosticts = {
		background = false,
	},
}
require('onedark').load()
