-- Format with ya style
-- NOTE: It's vibe-command. Be careful!
vim.api.nvim_set_keymap('n', '<C-m>',
    [[<Cmd>%!sh -c 'ya style | perl -0777 -pe '"'"'s/\n\z//'"'"''<CR>]], { noremap = true })

vim.api.nvim_create_user_command('YaStyleCheck', '!ya style --dry-run %', { bang = true })
