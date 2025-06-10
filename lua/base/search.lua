-- aliases --
local opt = vim.opt
local g = vim.g

--[[ search ]]--
-- Ignore case...
opt.ignorecase = true

-- ...but only when no uppercase letters
opt.smartcase = true

-- highlight matches
opt.showmatch = true
