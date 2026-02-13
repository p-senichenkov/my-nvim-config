--[[ Custom commands ]] --
-- Remove all trailing whitespaces and remove consecutive blank lines
vim.api.nvim_create_user_command('RmExtraWhitelines', [[
:%s/\s\+$//e
:%s/\n\{3,}/\r\r/e]], {})
