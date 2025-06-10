--[[ Key setting aliases ]]--
local map = vim.api.nvim_set_keymap

--[[
Normal mode remap
	key -- {string}
	command -- {string}
]]--
function nm(key, command)
	map('n', key, command, {noremap = true})
end

--[[
Input mode remap
	key -- {string}
	command -- {string}
]]--
function im(key, command)
	map('i', key, command, {noremap = true})
end

--[[
Visual mode remap
	key -- {string}
	command -- {string}
]]--
function vm(key, command)
	map('v', key, command, {noremap = true})
end

--[[
Terminal mode remap
	key -- {string}
	command -- {string}
]]--
function rm(key, command)
	map('t', key, command, {noremap = true})
end
