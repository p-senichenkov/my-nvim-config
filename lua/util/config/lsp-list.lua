--[[ A list of active LSP servers. Provides some access functions ]]--
M = {}

-- A list of servers. Add them here
M.list = { 'clangd', 'lua_ls', 'pylsp', 'gopls', 'cmake' }

-- Provides a lot of useful functions and can be used in generic for directly
M.iter = vim.iter(M.list)

-- Configurations for some servers
M.configs = {
	lua_ls = {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/luarc.jsonc')) then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					-- Most likely JIT is used
					version = 'LuaJIT',
				},

				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME
					}
				}
			})
		end,

		settings = {
			Lua = {}
		}
	},

	-- There are a lot of options for pylsp. See
	-- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
}

return M
