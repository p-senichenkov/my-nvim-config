local onedark_custom = require('lualine.themes.onedark')
local shorten_path = require('util.shorten_path')
local collections = require('util.collections')

onedark_custom.normal.c = { bg = 'bg' }
onedark_custom.inactive.c = { bg = 'bg' }
onedark_custom.inactive.a = onedark_custom.normal.b

local HOME = vim.fs.abspath('~')
local MAX_LEN = vim.o.columns / 5
local MAX_DEPTH = 4
local MAX_ENTRY_LEN = 15

-- Do not show pwd in these filetypes is file is readonly
local PWD_EXCLUDE_READONLY = collections.Set({ 'help' })

---@return string
local function pwd()
    if PWD_EXCLUDE_READONLY[vim.bo.filetype] and vim.bo.readonly then
        return ''
    end

    local filename = vim.api.nvim_buf_get_name(0)
    local dir_path = vim.fs.dirname(vim.fs.abspath(filename))
    if vim.startswith(dir_path, HOME) then
        dir_path = '~' .. dir_path:sub(#HOME + 1)
    end
    return shorten_path.shorten_path(dir_path, MAX_LEN, MAX_DEPTH, MAX_ENTRY_LEN)
end

---@return string
local function matches()
    local search_info = vim.fn.searchcount {
        recompute = 1,
        maxcount = 0,
    }

    local current = search_info.current
    local total = search_info.total
    if total == 0 then
        return ''
    end
    return string.format(' %d/%d', current, total)
end

local function get_filename_fg()
    if vim.bo.modified then
        return 'yellow'
    end
    if vim.bo.readonly then
        return 'gray'
    end
    return 'fg'
end

require('lualine').setup {
    options = {
        theme = onedark_custom,
        always_show_tabline = false,
    },

    -- Different behaviour for specific filetypes
    extensions = {
        'neo-tree',
    },

    -- [a b c    x y z]
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            pwd,
            {
                'filename',
                color = function(_)
                    return { bg = onedark_custom.normal.b.bg, fg = get_filename_fg() }
                end,
            },
        },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'filetype' },
        lualine_y = { { 'progress' }, matches },
        lualine_z = { 'location' }
    },

    inactive_sections = {
        lualine_a = {
            {
                'filename',
                color = function(_)
                    return { bg = onedark_custom.inactive.a.bg, fg = get_filename_fg() }
                end,
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' }
    },

    tabline = {
        lualine_a = {
            {
                'tabs',
                mode = 1,
                path = 3,
                symbols = {
                    modified = '•',
                },
            }
        }
    },
}
