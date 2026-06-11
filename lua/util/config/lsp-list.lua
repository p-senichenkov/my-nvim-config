--[[ A list of active LSP servers. Provides some access functions ]] --
M = {}

-- A list of servers. Add them here
M.list = {
    'clangd',
    'ruff',
    'zuban',
}

-- Provides a lot of useful functions and can be used in generic for directly
M.iter = vim.iter(M.list)

-- Explicitly disable these LSPs
M.disable = {
    -- GitLab AI companion
    'gitlab_duo',
}

-- Configurations for some servers
M.configs = {
    clangd = {
        cmd = { 'clangd', '--background-index', '-j=8', '-header-insertion=never' },
    }
}

return M
