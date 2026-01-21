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

-- Enable 'conceal' feature (visually replace one text with another)
vim.opt.conceallevel = 2
