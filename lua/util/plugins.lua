local M = {}

---@class LazyMappingSpec
---@field key string?
---@field cmd string
---@field mode string?
---@field desc string?

--- Lazy load plugin both on keys and commands
---@param plugin LazyPluginSpec
---@param mappings LazyMappingSpec[]
---@return LazyPluginSpec
function M.MakeLazyMappingsSpec(plugin, mappings)
    local keys = {}
    local cmd = {}
    for i, map in ipairs(mappings) do
        cmd[i] = map.cmd
        if map.key then
            keys[#keys + 1] = {
                map.key,
                '<cmd>' .. map.cmd .. '<cr>',
                mode = map.mode or 'n',
                desc = map.desc or '',
            }
        end
    end
    plugin.keys = keys
    plugin.cmd = cmd
    return plugin
end

return M
