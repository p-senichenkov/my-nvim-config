--[[ All dev plugins ]] --
local plugins_util = require('util.plugins')
local controller = require('util.plugin_controller')

---@type DevPluginSpec[]
local dev_specs = {
    {
        plugin_spec = {
            'p-senichenkov/arc-conflict.nvim',
            opts = {},
            event = 'User CustomArcConflict',
        },
    },

    {
        plugin_spec = plugins_util.MakeLazyMappingsSpec({
            'p-senichenkov/arcadia.nvim',
            opts = {},
        }, {
            {
                key = '<leader>A',
                cmd = 'OpenInArcanum',
                desc = 'Open current file in Arcanum',
            },
            {
                key = '<leader>cs',
                cmd = 'YaStyleCheck',
            },
            {
                key = '<C-m>',
                cmd = 'YaStyleApply',
            }
        }),
    },

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
