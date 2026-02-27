--[[ Custom commands ]] --
-- Remove all trailing whitespaces and remove consecutive blank lines
vim.api.nvim_create_user_command('RmExtraWhitelines', [[
:%s/\s\+$//e
:%s/\n\{3,}/\r\r/e]], {})

---@class EditInfo
---@field fname string
---@field line integer
---@field char integer

--- Open paths like `some/file:30:15`
---@param path string
---@return EditInfo?
local function ParseFileWithPos(path)
    local l = vim.lpeg
    local loc = l.locale()

    local fname_patt = l.Cg((1 - (loc.space + l.P(':'))) ^ 1, 'fname')
    local line_patt = l.P(':') * l.Cg(loc.digit ^ 1 / tonumber, 'line')
    local char_patt = l.P(':') * l.Cg(loc.digit ^ 1 / tonumber, 'char')
    local pattern = l.Ct(fname_patt ^ 1 ^ -1 * (line_patt ^ -1) * (char_patt ^ -1) * l.P(-1))

    local res = pattern:match(path)
    if res then
        res.line = res.line or 1
        res.char = res.char or 0
    end
    return res
end

vim.api.nvim_create_user_command('SmartEdit', function(args)
    if not args.args or #args.args == 0 then
        vim.cmd('edit')
        return
    end

    local e_info = ParseFileWithPos(args.args)
    if not e_info then
        vim.notify('Cannot parse argument: ' .. args.args, vim.log.levels.ERROR)
        return
    end

    vim.api.nvim_cmd({ cmd = 'edit', args = { e_info.fname } }, {})
    vim.api.nvim_win_set_cursor(0, { e_info.line, e_info.char })
end, { nargs = '?', complete = 'file' })

-- Turn :e into :SmartEdit
vim.keymap.set('ca', 'e', 'SmartEdit')
