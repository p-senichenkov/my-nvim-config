--[[ aliases ]]--
local opt = vim.opt
local g = vim.g

--[[ splits ]]--
-- Move new splits to the right
opt.splitright = true

-- Move horizontal splits to the bottom
-- opt.splitbelow = true

-- Disable auto-continuation of comments
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Disable mouse
opt.mouse = ''

-- Disable netrw (default file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Start scrolling before screen end
vim.opt.scrolloff = 2
