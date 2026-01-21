-- [[ LSP keymaps ]] --
local win_config = require('util.config.float')

local function vsplit()
	local win_nr = vim.api.nvim_open_win(0, false, { split = 'right' })
	vim.api.nvim_set_current_win(win_nr)
end

M = {}

function M.set_keymaps(bufnr)
	local telescope = require('telescope.builtin')

	-- Utility function to define LSP bindings
	local lspmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- Actions on current symbol
	lspmap('<F2>', vim.lsp.buf.rename, 'Rename')
	lspmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	-- "Go" actions
	lspmap('<F12>', telescope.lsp_definitions, 'Go to definition')
	-- <F24> is <S-F12>
	lspmap('<F24>', function()
		vsplit()
		telescope.lsp_definitions()
	end, 'Go to definition is split window')
	lspmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
	lspmap('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')

	-- Hover actions
	-- I have to redefine default binding, as they've deprecated ability to configure these
	-- options God knows what for
	lspmap('K', function()
		vim.lsp.buf.hover {
			border = win_config.border,
		}
	end, 'Hover')

	-- Format
	lspmap('<C-k>', vim.lsp.buf.format, 'Format current buffer')

	-- Switch header-source (clangd-specific)
	vim.keymap.set('n', '<leader>h', function()
		-- I don't like such way of calling functions, but looks like it's the only way
		vim.api.nvim_cmd(vim.api.nvim_parse_cmd('LspClangdSwitchSourceHeader', {}), {})
	end, { noremap = true })

	vim.keymap.set('n', '<leader>sh', function()
		vsplit()
		vim.api.nvim_cmd(vim.api.nvim_parse_cmd('LspClangdSwitchSourceHeader', {}), {})
	end, { noremap = true })
end

return M
