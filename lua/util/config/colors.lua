M = {}

M.colors = {
	border_color = '#13afff',
	line_nr_dark_gray = '#303030',
	line_nr_gray = '#606060',

	-- Treesitter
	neon_orange_bg = '#401f10',
	neon_cyan_bg = '#004f5e',
	neon_red_bg = '#5e0f00',
	neon_yellow_bg = '#005e10',

	-- It's not exactly Cryola blue. It's used for completion match highlight
	cryola_blue = '#1f55dc',
	-- everybody knows that ghosts are dark-violet
	ghost_violet = '#5d1b64',
	frost_sky = '#00a6fa',
}

M.highlights = {
	-- Line numbers and related
	['LineNr'] = { fg = '$line_nr_dark_gray' },
	['CursorLineNr'] = { fg = '$line_nr_gray' },
	['ColorColumn'] = { bg = 'magenta' },

	-- Treesitter
	['@comment.todo'] = { fg = 'orange', bg = '$neon_orange_bg', bold = true },
	['@comment.note'] = { fg = 'cyan', bg = '$neon_cyan_bg', bold = true },
	['@comment.error'] = { fg = 'red', bg = '$neon_red_bg', bold = true },
	['@comment.warning'] = { fg = 'yellow', bg = '$neon_yellow_bg', bold = true },

	-- nvim-cmp
	['cmp-float-border'] = { fg = '$border_color' },
	['CmpItemAbbrMatch'] = { fg = '$cryola_blue', bg = 'NONE' },
	-- ['CmpItemAbbrMatchFuzzy'] = { link = 'CmpItemAbbrMatch' },
	['GhostText'] = { fg = '$ghost_violet' },

	-- LSP diagnostics
	['DiagnosticError'] = { fg = 'red' },
	['DiagnosticWarn'] = { fg = 'magenta' },
	['DiagnosticHint'] = { fg = 'yellow' },
	['DiagnosticInfo'] = { fg = '$frost_sky' },
	['FloatBorder'] = { bg = 'bg', fg = '$border_color' },
	['NormalFloat'] = { bg = 'Normal' },

	-- I don't want concealed items to be specially highlighted
	['Conceal'] = { bg = 'Normal', fg = 'Normal' },

	-- LaTeX `\comment` command. NOTE this name is matched against custom command automatically
	['texCCommentArg'] = { fg = 'magenta', fmt = 'italic' },
}

return M
