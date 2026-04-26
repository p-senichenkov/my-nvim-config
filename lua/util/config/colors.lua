M = {}

M.colors = {
    border_color = '#13afff',
    line_nr_dark_gray = '#303030',
    line_nr_gray = '#606060',

    -- Treesitter
    neon_orange_bg = '#401f10',
    dark_cyan = '#004f5e',
    neon_red_bg = '#5e0f00',
    neon_yellow_bg = '#005e10',
    rifle_green = '#414833',

    -- It's not exactly Cryola blue
    cryola_blue = '#1f55dc',
    -- everybody knows that ghosts are dark-violet
    ghost_violet = '#5d1b64',
    frost_sky = '#00a6fa',
    -- It's very different from built-in DarkBlue
    dark_blue = '#002137',
    -- Used for list characters
    barely_visible = '#00007a'
}

M.highlights = {
    -- Line numbers and related
    ['LineNr'] = { fg = '$line_nr_dark_gray' },
    ['CursorLineNr'] = { fg = '$line_nr_gray' },
    ['ColorColumn'] = { bg = 'magenta' },

    -- Treesitter
    ['@comment.todo'] = { fg = 'orange', bg = '$neon_orange_bg', bold = true },
    ['@comment.note'] = { fg = 'cyan', bg = '$dark_cyan', bold = true },
    ['@comment.error'] = { fg = 'red', bg = '$neon_red_bg', bold = true },
    ['@comment.warning'] = { fg = 'yellow', bg = '$neon_yellow_bg', bold = true },
    ['@comment.documentation'] = { italic = true, fg = '$rifle_green' },

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

    -- Folds
    ['Folded'] = { bg = M.colors.dark_blue },
    ['FoldColumn'] = { bg = 'Normal', fg = '$line_nr_dark_gray' },

    -- Spell (WIP)
    ['SpellBad'] = { sp = 'Blue', undercurl = true },

    ['Whitespace'] = { fg = '$barely_visible' },
}

M.misc = {
    ['IblScope'] = { fg = M.colors.dark_cyan, nocombine = true },
}

return M
