--[[ All dev plugins ]] --
local plugins_util = require('util.plugins')
local controller = require('util.plugin_controller')

---@type DevPluginSpec[]
local dev_specs = {
    {
        plugin_spec = {
            'p-senichenkov/smart-edit.nvim',
            init = function()
                vim.keymap.set('ca', 'e', 'SmartEdit')
            end,
            config = function()
                require('plugins-config.smart-edit')
            end,
            cmd = { 'SmartEdit', 'SmartEditListProviders' }
        },
        fallback_to_git = true,
    },
}

controller.RegisterSpecs(dev_specs)

return controller.GetAllPlugins()
