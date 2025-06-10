--[[ Conceals for VimTeX ]] --
M = {}

local function simple_conceal(name, concealchar, mathmode)
	mathmode = mathmode == true
	return { name = name, mathmode = mathmode, opt = false, arg = false, concealchar = concealchar }
end

M.custom_cmds = {
	-- \amp -> &
	simple_conceal('amp', '&', true),
	-- \sub -> ⊂
	{ name = 'sub', cmdre = 'sub>', mathmode = 1, opt = false, arg = false, concealchar = '⊂' },
	-- \textunderscore -> _
	simple_conceal('textunderscore', '_'),
	-- \coloneq -> ≔
	simple_conceal('coloneq', '≔', true),
	-- \textasciicircum -> ^
	simple_conceal('textasciicircum', '^'),
	-- \O -> ∅
	{ name = 'O', cmdre = 'O>', mathmode = 1, opt = false, arg = false, concealchar = '∅' },

	-- trigonometry operators
	-- { name = 'sin', mathmode = 1, opt = false, arg = false, argstyle}

	-- \eps -> ε, etc.
	{ name = 'eps', mathmode = 1, opt = false, arg = false, concealchar = 'ε' },

	-- math sets (\R -> ℝ, etc.)
	-- regexp is needed to ensure it does not match e. g. \Re
	-- (c) `:help g:vimtex_syntax_custom_cmds`
	{ name = 'R', cmdre = 'R>', mathmode = 1, opt = false, arg = false, concealchar = 'ℝ' },
	{ name = 'Co', cmdre = 'Co>', mathmode = 1, opt = false, arg = false, concealchar = 'ℂ' },
	{ name = 'N', cmdre = 'N>', mathmode = 1, opt = false, arg = false, concealchar = 'ℕ' },

	-- TODO
	{ name = 'TODO', opt = false, argstyle = 'boldunder', hlgroup = '@comment.todo' },
	-- \comment
	{ name = 'comment', opt = false, conceal = true },

	-- Cyrillic em-dash
	-- { name = 'ru-dash', cmdre = '"\-\-\-', opt = false, arg = false, concealchar = '—' },

	-- simple conceals ("removes")
	{ name = 'textenglish', opt = false, conceal = true },
}

M.custom_cmds_with_concealed_delims = {
	-- \set{XX} -> {XX}
	{ name = 'set', cmdre = 'set>', mathmode = true, cchar_open = '{', cchar_close = '}' },
}

M.custom_envs = {
	-- make `equ` math environment
	{ name = 'equ', math = true },
}

return M
