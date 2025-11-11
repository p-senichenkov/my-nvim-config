--[[ Conceals for VimTeX ]] --
M = {}

local function simple_conceal(name, concealchar, mathmode)
	return {
		name = name,
		-- Dunno if it's necessary. Looks like it works fine without `cmdre`
		-- cmdre = name .. '>',
		mathmode = mathmode == true,
		opt = false,
		arg = false,
		concealchar = concealchar
	}
end

M.custom_cmds = {
	-- simple conceals (\xxx -> y)
	simple_conceal('amp', '&', true),
	simple_conceal('sub', '⊂', true),
	simple_conceal('textunderscore', '_'),
	simple_conceal('coloneq', '≔', true),
	simple_conceal('textasciicircum', '^'),
	simple_conceal('O', '∅', true),
	simple_conceal('di', 'd', true),
	simple_conceal('ii', '𝔦', true),
	simple_conceal('impliedby', '⇐', true),
	simple_conceal('eqqcolon', '≕', true),

	-- \eps -> ε, etc.
	{ name = 'eps', mathmode = 1, opt = false, arg = false, concealchar = 'ε' },

	-- math sets (\R -> ℝ, etc.)
	-- regexp is needed to ensure it does not match e. g. \Re
	-- (c) `:help g:vimtex_syntax_custom_cmds`
	{ name = 'R', cmdre = 'R>', mathmode = 1, opt = false, arg = false, concealchar = 'ℝ' },
	{ name = 'Co', cmdre = 'Co>', mathmode = 1, opt = false, arg = false, concealchar = 'ℂ' },
	{ name = 'N', cmdre = 'N>', mathmode = 1, opt = false, arg = false, concealchar = 'ℕ' },

	--[[ "styling" commands ]] --
	-- TODO
	{ name = 'TODO', opt = false, argstyle = 'boldunder', hlgroup = '@comment.todo' },
	-- \comment
	{ name = 'comment', opt = false, conceal = true },
	-- \part
	{ name = 'part', opt = false, argstyle = 'bold', conceal = true },

	-- "removes"
	{ name = 'textenglish', opt = false, conceal = true },
}

M.custom_cmds_with_concealed_delims = {
	-- \set{XX} -> {XX}
	{ name = 'set', mathmode = true, cchar_open = '{', cchar_close = '}' },
	{ name = 'Set', mathmode = true, cchar_open = '{', cchar_close = '}' },
	-- \eref{XX} -> (XX) (both math and text modes)
	{ name = 'eref', mathmode = true, cchar_open = '(', cchar_close = ')' },
	{ name = 'eref', cchar_open = '(', cchar_close = ')' },
	{ name = 'braket', mathmode = true, cchar_open = '⟨', cchar_close = '⟩' },
}

M.custom_envs = {
	-- make `equ` math environment
	{ name = 'equ', math = true },
}

return M
