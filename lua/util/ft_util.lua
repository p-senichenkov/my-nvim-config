local M = {}

--- Map a pattern to the filetype
---@param pattern string
---@param filetype string
---@return nil
function M.MapFiletype(pattern, filetype)
	vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
		pattern = pattern,
		callback = function (_)
			vim.bo.filetype = filetype
		end
	})
end

return M
