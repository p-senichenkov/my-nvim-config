--[[ Misc plugins ]] --
return {
    -- NeoTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        -- It's not really needed to open directory (and hijack netrw)
        keys = {
            { '<leader>-', '<cmd>Neotree toggle reveal_force_cwd<cr>', desc = 'Toggle NeoTree' },
        },
        cmd = 'Neotree',
    },

    -- More smart analyzer for highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        -- Cannot use `ft` here, since comments can appear in any file
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('plugins-config/treesitter')
        end,
    },

    -- Brackets auto-pairing
    {
        'windwp/nvim-autopairs',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'InsertEnter',
        config = true,
        -- NOTE: This plugin can work with specific Treesitter nodes, if needed
    },

    -- Git conflict higlight and keymaps
    {
        'akinsho/git-conflict.nvim',
        -- Update only when "version" is updated
        version = '*',
        opts = {},
        event = 'User CustomGitConflict',
    },

    -- "Ultimate FOlds"
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            -- NOTE: nvim-treesitter package is not needed
            'kevinhwang91/promise-async',
        },
        config = function()
            require('plugins-config.folds')
        end
    },
}
