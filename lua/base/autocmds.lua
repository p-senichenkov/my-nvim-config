-- [[ File info queries ]] --
local file_info_group = vim.api.nvim_create_augroup('FileInfo', { clear = true })

---@param cmd string[]
---@return boolean
local function success(cmd)
    local status = vim.system(cmd, { cwd = vim.fn.expand('%:p:h') }):wait()
    return status.code == 0
end

-- Buffer contains git conflict markers
vim.api.nvim_create_autocmd('BufReadPost', {
    group = file_info_group,
    callback = function()
        if vim.fn.search('<<<<<<<', 'nw') > 0 then
            if success({ 'git', 'status' }) then
                vim.api.nvim_exec_autocmds('User', { pattern = 'CustomGitConflict' })
            elseif success({ 'arc', 'status' }) then
                vim.api.nvim_exec_autocmds('User', { pattern = 'CustomArcConflict' })
            end
        end
    end,
})
