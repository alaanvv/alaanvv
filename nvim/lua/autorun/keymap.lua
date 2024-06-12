vim.g.mapleader = ' '
vim.keymap.set('', '<Space>', '<Nop>', {})

-- Movement
vim.keymap.set('n', '<C-a>',    'gg1vG$', {})
vim.keymap.set('n', '<C-Up>',   'yyP', {})
vim.keymap.set('n', '<C-Down>', 'yyp', {})
vim.keymap.set('n', 'J',        '<C-d>zz', {})
vim.keymap.set('n', 'K',        '<C-u>zz', {})
vim.keymap.set('n', '<A-Up>',   'ddkP', {})
vim.keymap.set('n', '<A-Down>', 'ddp', {})

vim.keymap.set('i', '<C-g>', '<C-x><C-o>', {})
vim.keymap.set('i', '<C-j>', 'pumvisible() ? "\\<C-n>"   : "\\<C-j>"', { noremap = true, expr = true, silent = true })
vim.keymap.set('i', '<C-k>', 'pumvisible() ? "\\<C-p>"   : "\\<C-k>"', { noremap = true, expr = true, silent = true })
vim.keymap.set('i', '<C-h>', 'pumvisible() ? "\\<C-e>"   : "\\<C-h>"', { noremap = true, expr = true, silent = true })
vim.keymap.set('i', '<C-l>', 'pumvisible() ? "\\<Enter>" : "\\<C-l>"', { noremap = true, expr = true, silent = true })

-- Buffer
vim.keymap.set('n', '<C-j>', ':bprev <CR>', {})
vim.keymap.set('n', '<C-k>', ':bnext <CR>', {})
vim.keymap.set('n', '<C-b>', ':bw! <CR>', {})
vim.keymap.set('n', '<C-s>', ':w! <CR>', {})

-- Code
vim.keymap.set('n', '<leader>r', '*:%s///gc<Left><Left><Left>', {})

-- Terminal
-- vim.keymap.set('n', '<leader>c', ':terminal mkdir -p ../build && cd ../build && cmake .. && make && ./Script <CR>', {})
-- vim.keymap.set('n', '<leader>C', ':terminal gcc % -o %:r -lm; ./%:r', {})
vim.keymap.set('n', '<leader>c', [[:lua if vim.fn.filereadable('run.sh') == 1 then vim.cmd('silent !gnome-terminal --tab -- bash -c "bash run.sh"') else print('No `run.sh`') end <CR>]], { silent = true })

-- Directory
vim.keymap.set('n', '<leader>p', ':cd %:p:h <CR>', {})
vim.keymap.set('n', '<leader>o', ':cd .. <CR>', {})
