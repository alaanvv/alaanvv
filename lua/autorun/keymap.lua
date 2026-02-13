-- Basic Vim Moves
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')

-- Line operations
vim.keymap.set('n', 'J',     ':t.  <CR>')
vim.keymap.set('n', 'K',     ':t-1 <CR>')
vim.keymap.set('n', '<A-k>', ':m-2 <CR>')
vim.keymap.set('n', '<A-j>', ':m+1 <CR>')
