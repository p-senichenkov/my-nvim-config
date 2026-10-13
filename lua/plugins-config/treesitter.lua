local collections = require('util.collections')
local treesitter = require('nvim-treesitter')

treesitter.install {
    'cpp',
    'yaml',
    'python',
    'comment',
}

-- @spell capture applies to all text that should be spell-checked.
-- Obviously, it shouldn't introduce some special color.
vim.api.nvim_set_hl(0, '@spell', {})
vim.api.nvim_set_hl(0, '@nospell', {})

-- A set of filetypes that require `spell` to be enabled unconditionally
local always_on = collections.Set({ 'tex', 'gitcommit' })

vim.opt.spelllang = { 'en', 'ru_yo' }
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        -- Treesitter highlighting now requires to be enabled manually
        pcall(vim.treesitter.start, args.buf)

        -- Enable spellcheck in buffers that have parser installed
        local ftype = vim.bo.filetype
        if always_on[ftype] then
            vim.opt_local.spell = true
            return
        end

        local installed = collections.BoolSet(treesitter.get_installed())
        vim.opt_local.spell = installed[ftype]
    end
})
