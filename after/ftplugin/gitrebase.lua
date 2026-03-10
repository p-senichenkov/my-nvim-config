---@param key string
---@param command string
---@return nil
local function GitRebaseKeymap(key, command)
	vim.keymap.set('n', '<leader>' .. key, function()
		vim.cmd { cmd = command }
	end, { buffer = true, desc = command .. ' current line', noremap = true })
end

-- Some convenient key bindings
GitRebaseKeymap('d', 'Drop')
GitRebaseKeymap('e', 'Edit')
GitRebaseKeymap('f', 'Fixup')
GitRebaseKeymap('p', 'Pick')
GitRebaseKeymap('r', 'Reword')
GitRebaseKeymap('s', 'Squash')
