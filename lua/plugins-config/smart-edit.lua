local smart_edit = require('smart-edit')

local providers = {}

providers[#providers + 1] = smart_edit.available_providers.FilenameWithPos

local status, arcadia = pcall(require, 'arcadia')
if status then
    providers[#providers + 1] = arcadia.smart_edit_providers.ArcanumLink
end

require('smart-edit').setup {
    providers = providers,
    hijack_e = false,
}
