vim.cmd('autocmd BufNewFile,BufRead *.[h|f|v] set filetype=c', false)
vim.cmd('colorscheme retrobox', false)

vim.o.titlestring = '%f'    
vim.o.title = true
vim.o.cursorline = true
vim.o.showmode   = false
vim.o.number     = true
vim.o.ruler      = false
vim.o.wrap       = false
vim.o.scrolloff     = 8
vim.o.sidescrolloff = 8
vim.o.numberwidth   = 1
vim.o.showtabline   = 0
vim.o.cmdheight     = 1
vim.o.signcolumn    = 'no'
vim.o.colorscheme   = 'retrobox'
vim.opt.clipboard:append{ 'unnamed', 'unnamedplus' }
vim.opt.fillchars = 'eob: '

vim.o.expandtab   = true
vim.o.ignorecase  = false
vim.o.backup      = false 
vim.o.writebackup = false
vim.o.swapfile    = false
vim.o.shiftwidth  = 2
vim.o.tabstop     = 2

vim.g.mapleader = ' '
vim.api.nvim_set_keymap('', '<Space>',      '<Nop>', {})
vim.api.nvim_set_keymap('n', '<C-a>',      'gg0vG$', {})
vim.api.nvim_set_keymap('n', '<C-Up>',     'yyP', {})
vim.api.nvim_set_keymap('n', '<C-Down>',   'yyp', {})
vim.api.nvim_set_keymap('n', '<A-Up>',     'ddkP', {})
vim.api.nvim_set_keymap('n', '<A-Down>',   'ddp', {})
vim.api.nvim_set_keymap('n', '<C-j>',      ':bprev<CR>', {})
vim.api.nvim_set_keymap('n', '<C-k>',      ':bnext<CR>', {})
vim.api.nvim_set_keymap('n', '<C-b>',      ':bw! <CR>', {})
vim.api.nvim_set_keymap('n', '<C-s>',      ':w! <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>r',  '*:%s///gc<Left><Left><Left>', {})
vim.api.nvim_set_keymap('n', '<leader>c',  ':terminal mkdir -p ../build && cd ../build && cmake .. && make && ./Script <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>rc', ':terminal gcc % -o %:r -lm; ./%:r', {})
vim.api.nvim_set_keymap('n', '<leader>n',  ':e ', {})

vim.api.nvim_set_keymap('n', '<leader>p',  ':cd %:p:h <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>o',  ':cd .. <CR>', {})

local checkpoints = {}

function checkpoint()
  local filename = vim.fn.expand('%')
  if checkpoints[filename] then
    vim.cmd(':' .. checkpoints[filename])
    checkpoints[filename] = nil
  else 
    checkpoints[filename] = vim.api.nvim_win_get_cursor(0)[1]
    print('Checkpoint set at ' .. vim.api.nvim_win_get_cursor(0)[1])
  end
end

vim.keymap.set('n', '<leader>s', checkpoint , {})

--

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
require('clear-themes')
