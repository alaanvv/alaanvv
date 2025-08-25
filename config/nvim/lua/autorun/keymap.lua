vim.g.mapleader = ' '
vim.keymap.set('', '<Space>', '<Nop>')

-- Basic Vim Moves
vim.keymap.set('n', 'x', '"_x')

-- Autocomplete
vim.keymap.set('i', '<C-g>', '<C-x><C-o>')
vim.keymap.set('i', '<C-j>', 'pumvisible() ? "<C-n>" : "<C-n>"', { expr = true })
vim.keymap.set('i', '<C-k>', 'pumvisible() ? "<C-p>" : "<C-p>"', { expr = true })
vim.keymap.set('i', '<C-h>', 'pumvisible() ? "<C-e>" : "<C-h>"', { expr = true })
vim.keymap.set('i', '<C-l>', 'pumvisible() ? "<C-y>" : "<C-l>"', { expr = true })

-- Selection
vim.keymap.set('n', '<C-a>', 'gg0vG$')
vim.keymap.set('v', '<C-a>', 'gg0vG$')

-- Duplicate Line
vim.keymap.set('n', 'J', ':t.<Enter>')
vim.keymap.set('n', 'K', ':t.-1<Enter>')

-- Move Line
vim.keymap.set('n', '<A-k>',     ':m .-2<Enter>')
vim.keymap.set('n', '<A-j>',     ':m .+1<Enter>')
vim.keymap.set('n', '<leader>E', ':lua vim.diagnostic.goto_next()<Enter>')

-- Increase/Decrease
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Replace
vim.keymap.set('n', '<leader>r', '*:%s///gc<Left><Left><Left>')
vim.keymap.set('n', '<leader>z', 'exists("`z") ? "`z" : "mz"', { expr = true })

-- Buffer
vim.keymap.set('n', '<C-j>', ':bprev <CR>')
vim.keymap.set('n', '<C-k>', ':bnext <CR>')
vim.keymap.set('n', '<C-b>', ':bw! <CR>')
vim.keymap.set('n', '<C-s>', ':w! <CR>')

-- Lua
vim.keymap.set('n', '<space><space>x', ':source %<Enter>')
vim.keymap.set('n', '<space>x',        ':.lua<Enter>')
vim.keymap.set('v', '<space>x',        ':lua<Enter>')

-- Terminal
vim.keymap.set('n', '<leader>t', ':terminal<Enter>a')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Run
vim.keymap.set('n', '<leader>c', [[:lua if vim.fn.filereadable('run.sh') == 1 then vim.cmd('silent !kitty bash -c "bash run.sh"') else print('No `run.sh`') end <CR>]], { silent = true })

-- Directory
vim.keymap.set('n', '<leader>p', ':cd %:p:h <CR>')
vim.keymap.set('n', '<leader>o', ':cd .. <CR>')

-- Plugin
vim.keymap.set('n', '<leader>h', HTTP)
vim.keymap.set('n', 'Hc',        HTTP_Create)
vim.keymap.set('n', 'He',        HTTP_Edit)
vim.keymap.set('n', 'Hd',        HTTP_Delete)
vim.keymap.set('n', 'Hr',        HTTP_Run)
vim.keymap.set('n', 'HH',        HTTP_Run_Last)
vim.keymap.set('n', '<leader>b', Show_Buffers)
