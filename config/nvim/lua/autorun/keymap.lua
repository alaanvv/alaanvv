vim.g.mapleader = ' '

-- Basic Vim Moves
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', ';', ':')

-- Line operations
vim.keymap.set('n', 'J', ':t.<CR>')
vim.keymap.set('n', 'K', ':t.-1<CR>')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>')
vim.keymap.set('n', '<A-j>', ':m .+1<CR>')

-- Buffer
vim.keymap.set('n', '<C-j>', ':bprev<CR>')
vim.keymap.set('n', '<C-k>', ':bnext<CR>')
vim.keymap.set('n', '<C-b>', ':bw!<CR>')
vim.keymap.set('n', '<C-s>', ':w! <CR>')
