local M = {}

local collections = require('util.collections')

--[[ Enable 24-bit color ]] --
vim.opt.termguicolors = true

--[[ Line numbers ]] --
local ignored_ftypes = collections.Set { 'help', 'neo-tree' }

function M.ProperLnum()
    if ignored_ftypes[vim.bo.ft] then
        return ''
    end

    if vim.v.virtnum ~= 0 then
        return ''
    end

    local relnum = vim.v.relnum

    if relnum == 0 then
        return vim.v.lnum
    end
    return relnum
end

-- Make lines numbered (relative to current line)
vim.opt.numberwidth = 2
vim.opt.statuscolumn = [[%=%{v:lua.require('base.appearance').ProperLnum()}]]

-- Highlight current line number
vim.opt.cursorlineopt = 'number'
vim.opt.cursorline = true

-- Max completion popup size
vim.opt.pumheight = 20

-- Highlight too long lines (compared to colorcolumn, highlights only bad lines)
-- This works without autocmd, but fails under some strange circumstances (for example, ssh)
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter' }, {
    callback = function()
        vim.fn.matchadd('ColorColumn', '\\%101v', 100)
    end,
})

-- Enable 'conceal' feature (visually replace one text with another)
vim.opt.conceallevel = 2

-- Disable "[3/10]" below statusline
vim.opt.shortmess:append('S')
-- Disable "recording @X" messages
vim.opt.shortmess:append('q')

-- Make tabs and trailing spaces visible
vim.opt.list = true
vim.opt.listchars = "tab:<->,trail:␣"

return M
