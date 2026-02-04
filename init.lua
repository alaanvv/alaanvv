-- General
vim.cmd.colorscheme('retrobox')
vim.o.title           = true
vim.o.titlestring     = 'nvim'
vim.o.cursorline      = true
vim.o.number          = true
vim.o.numberwidth     = 1
vim.o.signcolumn      = 'no'
vim.opt.fillchars     = 'eob: '
vim.o.updatetime      = 500
vim.o.scrolloff       = 8
vim.o.sidescrolloff   = 8
vim.o.shiftwidth      = 2
vim.o.tabstop         = 2
vim.o.expandtab       = true
vim.o.showmode        = false
vim.o.wrap            = false
vim.o.writebackup     = false
vim.o.swapfile        = false
vim.o.backup          = false
vim.opt.clipboard     = 'unnamed,unnamedplus'
vim.o.splitright      = true
vim.o.splitbelow      = true
vim.opt.conceallevel  = 2
vim.opt.concealcursor = ''

-- Autorun
for _, file in ipairs(vim.fn.glob(vim.fn.stdpath('config') .. '/lua/autorun/*.lua', false, true)) do
  require(file:match('.*/(autorun/.+)%.lua$'))
end

-- Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system('git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable' .. lazypath)
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', { change_detection = { notify = false } })
