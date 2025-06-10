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
vim.fn.matchadd('ColorColumn', '\\%101v', 100)

-- Enable 'conceal' feature (visually replace one text with another)
vim.opt.conceallevel = 2
