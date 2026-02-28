local coll = require('util.collections')

local ufo = require('ufo')

local no_foldcolumn = coll.Set({ 'neo-tree' })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
	callback = function(_)
		if no_foldcolumn[vim.bo.filetype] then
			vim.opt.foldcolumn = '0'
		else
			vim.opt.foldcolumn = '1'
		end
	end
})

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Let ufo handle zR and zM, because by default NVim messes with foldlevel
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)

-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#customize-fold-text
local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (' 󰁂 %d '):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, 'MoreMsg' })
	return newVirtText
end

ufo.setup {
	provider_selector = function(_, _, _)
		return { 'treesitter', 'indent' }
	end,
	-- Display number of folded lines instead of ellipsis
	fold_virt_text_handler = handler,
}
