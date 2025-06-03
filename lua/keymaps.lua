-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
---------------------
-- Custom Keymaps ---
---------------------
-- Make a new line without entering insert mode after
vim.keymap.set('n', '<leader>o', ':put _<CR>', { noremap = true, silent = true }) -- New line below
vim.keymap.set('n', '<leader>O', ':put! _<CR>', { noremap = true, silent = true }) -- New line above

-- Don't yank on d/D/c/C, but keep x/X as-is
vim.keymap.set('n', 'd', [["_d]], { noremap = true, silent = true, desc = 'Delete w/o yanking' })
vim.keymap.set('n', 'D', [["_D]], { noremap = true, silent = true, desc = 'Delete w/o yanking to EOL' })
vim.keymap.set('n', 'c', [["_c]], { noremap = true, silent = true, desc = 'Change w/o yanking' })
vim.keymap.set('n', 'C', [["_C]], { noremap = true, silent = true, desc = 'Change w/o yanking to EOL' })
-- Reimplement default "dd" behavior which was changed due to the above keymaps
vim.keymap.set('n', '<leader>dd', '0yydd', { noremap = true, silent = true, desc = 'Yank and delete the current line' })

-- Save file with Ctrl+S in normal mode
vim.keymap.set('n', '<C-s>', ':wa<CR>', { noremap = true, silent = true, desc = 'Save current file' })
-- Save file with Ctrl+S in insert mode (escapes, saves, and re-enters insert mode after cursor)
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save current file' })

-- Close current buffer with <leader>q
vim.keymap.set('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current buffer' })
-- Close all buffers and quit Neovim with <leader>x
vim.keymap.set(
    'n',
    '<leader>x',
    ':wqa<CR>',
    { noremap = true, silent = true, desc = 'Close all buffers and quit Neovim' }
)
vim.keymap.set('i', '<leader>x', '<Esc>:wqa<CR>', { noremap = true, silent = true, desc = 'Save current file' })

-- Keep selection when indenting
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = 'Indent left and keep selection' })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = 'Indent right and keep selection' })
-- vim: ts=2 sts=2 sw=2 et
