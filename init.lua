-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

function _G.ReloadConfig()
    -- Unload relevant modules
    for name, _ in pairs(package.loaded) do
        if
            name:match '^custom'
            or name:match '^kickstart'
            or name:match '^keymaps'
            or name:match '^options'
            or name:match '^lazy%-plugins'
            or name:match '^lazy%-bootstrap'
        then
            package.loaded[name] = nil
        end
    end

    -- Re-run init.lua
    dofile(vim.env.MYVIMRC)
    print '🔁 Neovim config reloaded.'
end

-- [[ Set terminal title ]]

-- Make sure Neovim does not auto-set the terminal title
vim.o.title = false

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'DirChanged', 'VimEnter' }, {
    callback = function()
        local file = vim.fn.expand '%:t' or ''
        local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
        local max_len = 24

        if #file > max_len then
            local keep = math.floor((max_len - 1) / 2)
            local head = file:sub(1, keep)
            local tail = file:sub(-keep)
            file = head .. '…' .. tail
        end

        local title = file ~= '' and string.format('%s (%s)', file, dir) or dir

        io.write(string.format('\027]2;%s\007', title))
        io.flush()
    end,
})

-- vim.o.titlestring = "(%{fnamemodify(getcwd(), ':~')}) %t"
--
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'DirChanged', 'BufWinEnter' }, {
--     callback = function()
--         local file = vim.fn.expand '%:t' or ''
--         local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
--         local title = file ~= '' and string.format('%s (%s)', file, dir) or dir
--         -- OSC escape sequence to set terminal title
--         io.write(string.format('\027]2;%s\007', title))
--         io.flush()
--     end,
-- })
--
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
