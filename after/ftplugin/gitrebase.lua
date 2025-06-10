-- Some convenient key bindings
vim.keymap.set('n', '<leader>f', '0cwfixup<Esc>', { buffer = true, desc = 'Fixup current line' })
vim.keymap.set('n', '<leader>s', '0cwsquash<Esc>', { buffer = true, desc = 'Squash current line' })
