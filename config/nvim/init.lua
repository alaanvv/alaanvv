vim.o.updatetime    = 500
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
vim.opt.clipboard   = 'unnamed,unnamedplus'
vim.o.shiftwidth    = 2
vim.o.tabstop       = 2
vim.o.expandtab     = true
vim.o.writebackup   = false
vim.o.swapfile      = false
vim.o.backup        = false

vim.cmd('autocmd BufNewFile,BufRead *.[c|h] set filetype=cpp')
vim.cmd('autocmd BufNewFile,BufRead *.[f|v] set filetype=')
vim.cmd('autocmd VimLeavePre * mksession! ' .. vim.fn.stdpath('config') .. '/session.vim')

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = "*",
  callback = function()
    local ti = 0
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
        ti = ti + 1
      end
    end
    ti = ti - 1

    vim.api.nvim_buf_set_name(0, ti == 0 and 'terminal' or ('terminal[' .. ti .. ']'))
    vim.opt_local.relativenumber = false
    vim.opt_local.number         = false
  end
})

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
