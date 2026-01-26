--[[ Conceals for VimTeX ]] --
M = {}

local function simple_conceal(name, concealchar, mathmode)
	return {
		name = name,
		mathmode = mathmode == true,
		opt = false,
		arg = false,
		concealchar = concealchar
	}
end

M.custom_cmds = {
	-- [[ simple conceals (\xxx -> y) ]] --
	-- math
	simple_conceal('amp', '&', true),
	simple_conceal('sub', '⊂', true),
	simple_conceal('O', '∅', true),
	simple_conceal('di', 'd', true),
	simple_conceal('ii', '𝔦', true),
	simple_conceal('impliedby', '⇐', true),
	simple_conceal('coloneq', '≔', true),
	simple_conceal('eqqcolon', '≕', true),
	simple_conceal('eps', 'ε', true),
	simple_conceal('sum', '∑', true),
	simple_conceal('dotsb', '⋯', true),
	-- text
	simple_conceal('textunderscore', '_'),
	simple_conceal('textasciicircum', '^'),

	-- math sets (\R -> ℝ, etc.)
	simple_conceal('R', 'ℝ', true),
	simple_conceal('Co', 'ℂ', true),
	simple_conceal('N', 'ℕ', true),

	--[[ "styling" commands ]] --
	{ name = 'TODO', opt = false, argstyle = 'boldunder', hlgroup = '@comment.todo' },
	{ name = 'comment', opt = false, conceal = true },
	{ name = 'part', opt = false, argstyle = 'bold', conceal = true },

	-- "removes"
	{ name = 'textenglish', opt = false, conceal = true },
}

M.custom_cmds_with_concealed_delims = {
	{ name = 'set', mathmode = true, cchar_open = '{', cchar_close = '}' },
	{ name = 'Set', mathmode = true, cchar_open = '{', cchar_close = '}' },
	{ name = 'eref', mathmode = true, cchar_open = '(', cchar_close = ')' },
	{ name = 'eref', cchar_open = '(', cchar_close = ')' },
	{ name = 'braket', mathmode = true, cchar_open = '⟨', cchar_close = '⟩' },
}

M.custom_envs = {
	-- make `equ` math environment
	{ name = 'equ', math = true },
}

return M
