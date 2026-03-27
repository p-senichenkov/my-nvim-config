-- [[ File info queries ]] --
local file_info_group = vim.api.nvim_create_augroup('FileInfo', { clear = true })

---@param name string
---@return boolean
local function exists(name)
    local curr_fname = vim.api.nvim_buf_get_name(0)
    local res = vim.fs.find(name, { upward = true, path = curr_fname })
    return #res > 0
end

-- Buffer contains git conflict markers
vim.api.nvim_create_autocmd('BufReadPost', {
    group = file_info_group,
    callback = function()
        if vim.fn.search('\\M<<<<<<<', 'nw') > 0 then
            if exists('.git') then
                vim.api.nvim_exec_autocmds('User', { pattern = 'CustomGitConflict' })
            elseif exists('.arc') then
                vim.api.nvim_exec_autocmds('User', { pattern = 'CustomArcConflict' })
            else
                vim.notify('Unknown VCS', vim.log.levels.WARN)
            end
        end
    end,
})
