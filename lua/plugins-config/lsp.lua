local win_config = require('util/config/float')
local diag = vim.diagnostic

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        require('keys.lsp').set_keymaps(bufnr)

        -- Change disagnostic signs appearance
        diag.config {
            signs = {
                text = {
                    [diag.severity.ERROR] = '󰅚',
                    [diag.severity.WARN] = '󰀪',
                    [diag.severity.HINT] = '󰌶',
                    [diag.severity.INFO] = '',
                },
            },
        }

        vim.o.updatetime = 400
        vim.api.nvim_create_autocmd('CursorHold', {
            buffer = bufnr,

            callback = function()
                -- Show diagnostics floating window on cursor hold
                vim.diagnostic.open_float(nil, {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = win_config.border,
                    source = 'if_many',
                    prefix = '',
                    scope = 'cursor',
                    format = function(diagnostic)
                        local border_colors = {
                            [diag.severity.ERROR] = 'DiagnosticError',
                            [diag.severity.WARN] = 'DiagnosticWarn',
                            [diag.severity.HINT] = 'DiagnosticHint',
                            [diag.severity.INFO] = 'DiagnosticInfo',
                        }

                        -- Save old highlight
                        local old_hl = vim.api.nvim_get_hl(0, { name = 'FloatBorder' })
                        vim.api.nvim_set_hl(0, 'FloatBorder', {
                            link = border_colors[diagnostic.severity]
                        })

                        vim.api.nvim_create_autocmd('CursorMoved', {
                            callback = function()
                                vim.api.nvim_set_hl(0, 'FloatBorder', old_hl)
                                -- Execute only once (pcall catches any errors)
                                pcall(vim.api.nvim_del_autocmd,
                                    vim.api.nvim_get_autocmds({ event = 'CursorMoved' })[1].id)
                            end
                        })

                        return diagnostic.message
                    end,
                })
            end,
        })

        vim.diagnostic.config({
            virtual_text = {
                prefix = '',
            },
        })
    end,
})
