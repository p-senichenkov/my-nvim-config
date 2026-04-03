--[[ Enable 24-bit color ]] --
vim.opt.termguicolors = true

--[[ Line numbers ]] --
-- Make lines numbered (relative to current line)
vim.opt.number = true
vim.opt.relativenumber = true

-- Show folds
vim.opt.foldcolumn = 'auto'

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
