vim.g.netrw_banner    = 0
vim.g.netrw_keepdir   = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'

vim.keymap.set('n', '<C-t>', ':Ex<CR>')

vim.api.nvim_create_augroup('netrw', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'netrw',
  pattern = 'netrw',
  callback = function()
    vim.api.nvim_command('setlocal buftype=nofile')
    vim.api.nvim_command('setlocal bufhidden=wipe')
    vim.opt_local.winbar = '%!v:lua.WinBarNetRW()'
    vim.keymap.set('n', 'h', '-',    { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'l', '<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', '?', '<F1>', { remap = true, silent = true, buffer = true })
  end
})

WinBarNetRW = function()
  return '%#StatusLine# ' .. vim.fn.expand('%:~') .. '%= NETRW %<'
end
