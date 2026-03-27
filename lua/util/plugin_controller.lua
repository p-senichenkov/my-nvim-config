local M = {}

local vars = require('util.config.vars')

---@class LazyPluginSpec: table

---@class DevPluginSpec
---@field plugin_spec LazyPluginSpec
---@field fallback_to_git boolean?

---@type LazyPluginSpec[]
M.loaded_from_git_plugins = {}

---@type LazyPluginSpec[]
M.loaded_local_plugins = {}

---@type LazyPluginSpec[]
M.disabled_plugins = {}

local dev_path = vim.fs.abspath(vars.lazy.dev_path)
local DEBUG = false

---@param plugin LazyPluginSpec
---@return boolean
local function IsLocalPluginAvailable(plugin)
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

---@param specs DevPluginSpec[]
function M.RegisterSpecs(specs)
    for _, spec in ipairs(specs) do
        local pl_spec = spec.plugin_spec
        -- Local plugins always has the greatest priority
        if IsLocalPluginAvailable(spec.plugin_spec) then
            pl_spec.dev = true
            table.insert(M.loaded_local_plugins, pl_spec)
        else
            if spec.fallback_to_git then
                table.insert(M.loaded_local_plugins, pl_spec)
            else
                pl_spec.cond = false
                table.insert(M.disabled_plugins, pl_spec)
            end
        end
    end
end

---@return LazyPluginSpec[]
function M.GetAllPlugins()
    ---@type LazyPluginSpec[]
    local res = {}
    vim.list_extend(res, M.loaded_from_git_plugins)
    vim.list_extend(res, M.loaded_local_plugins)
    vim.list_extend(res, M.disabled_plugins)
    return res
end

return M
