vim.g.mapleader = ' '
vim.keymap.set('', '<Space>', '<Nop>')

-- Basic Vim Moves
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('i', 'jj', '<Esc>')

-- Selection
vim.keymap.set('n', '<C-a>', 'gg0vG$')
vim.keymap.set('v', '<C-a>', 'gg0vG$')

-- Duplicate Line
vim.keymap.set('n', 'J', ':t.<CR>')
vim.keymap.set('n', 'K', ':t.-1<CR>')

-- Move Line
vim.keymap.set('n', '<A-k>', ':m .-2<CR>')
vim.keymap.set('n', '<A-j>', ':m .+1<CR>')

-- Replace
vim.keymap.set('n', '<leader>r', '*:%s///gc<Left><Left><Left>')

-- Buffer
vim.keymap.set('n', '<C-j>', ':bprev<CR>')
vim.keymap.set('n', '<C-k>', ':bnext<CR>')
vim.keymap.set('n', '<C-b>', ':bw!<CR>')
vim.keymap.set('n', '<C-s>', ':w! <CR>')

-- Lua
vim.keymap.set('v', '<space>x', ':lua<CR>')

-- Directory
vim.keymap.set('n', '<leader>p', ':cd %:p:h<CR>:pwd<CR>')
