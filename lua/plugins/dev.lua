--[[ All dev plugins ]] --
local dev_path = vim.fs.abspath(require('util.config.vars').lazy.dev_path)
local DEBUG = false

-- Load dev plugins only when they are available
---@return boolean
local function dev_cond(plugin)
    local path = plugin[1]

    if not vim.uv.fs_stat(dev_path) then
        if DEBUG then
            vim.notify('Skipping dev plugin ' .. path .. ': no dev directory ' .. dev_path,
                vim.log.levels.DEBUG)
        end
        return false
    end

    local slash_pos, _ = string.find(path, '/', 1, true)
    if slash_pos then
        path = string.sub(path, slash_pos, -1)
    end
    path = dev_path .. '/' .. path
    local stat = vim.uv.fs_stat(path)
    -- fs_stat automatically follows symlinks
    if DEBUG and not stat then
        vim.notify('Skipping plugin ' .. plugin[1] .. ': no such directory')
    end
    return stat ~= nil
end

Plugins = {
    {
        'p-senichenkov/arc-conflict.nvim',
        opts = {},
        event = 'User CustomArcConflict',
    },

    {
        'p-senichenkov/arcadia.nvim',
        opts = {},
        keys = {
            { '<leader>A', '<cmd>OpenInArcanum<cr>', desc = 'Open current file in Arcanum' },
        }
    }
}

for _, plugin in ipairs(Plugins) do
    plugin.cond = dev_cond
    plugin.dev = true
end
return Plugins
