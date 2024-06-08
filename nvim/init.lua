vim.cmd('autocmd BufNewFile,BufRead *.[h|f|v] set filetype=c')

vim.o.titlestring   = '%f'
vim.o.title         = true
vim.o.showmode      = false
vim.o.wrap          = false
vim.o.cursorline    = true
vim.o.number        = true
vim.o.numberwidth   = 1
vim.opt.fillchars   = 'eob: '
vim.o.signcolumn    = 'no'
vim.o.scrolloff     = 8
vim.o.sidescrolloff = 8

vim.opt.clipboard = 'unnamed,unnamedplus'
vim.o.shiftwidth  = 2
vim.o.tabstop     = 2
vim.o.expandtab   = true

vim.o.writebackup = false
vim.o.swapfile    = false
vim.o.backup      = false

for _, file in ipairs(vim.fn.glob(vim.fn.stdpath('config') .. '/lua/autorun/*.lua', false, true)) do
  if file:match('%.lua$') then
    require(file:match('.*/(autorun/.+)%.lua$'))
  end
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system('git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable' .. lazypath)
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', { change_detection = { notify = false } })
