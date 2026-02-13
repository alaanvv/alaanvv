vim.cmd.colorscheme('retrobox')
Actions             = {}
vim.g.mapleader     = ' '
vim.o.clipboard     = 'unnamedplus'
vim.o.signcolumn    = 'no'
vim.o.fillchars     = 'eob: ,diff: ,fold: '
vim.o.listchars     = 'tab:··'
vim.o.list          = true
vim.o.wrap          = false
vim.o.showmode      = false
vim.o.cursorline    = true
vim.o.swapfile      = false
vim.o.undofile      = true
vim.o.number        = true
vim.o.numberwidth   = 1
vim.o.scrolloff     = 8
vim.o.sidescrolloff = 8
vim.o.shiftwidth    = 2
vim.o.tabstop       = 2
vim.o.conceallevel  = 2
vim.o.updatetime    = 500

for _, file in ipairs(vim.fn.glob(vim.fn.stdpath('config') .. '/lua/autorun/*.lua', false, true)) do
  require(file:match('.*/(autorun/.+)%.lua$'))
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system('git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable' .. lazypath)
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', { change_detection = { notify = false } })
