vim.cmd('autocmd BufWritePre * if &filetype != \'markdown\' | lua Clear_Trailing_Space() | endif')

function Clear_Trailing_Space()
  local pos = vim.fn.getpos('.')
  vim.cmd('%s/\\s\\+$//e')
  vim.fn.setpos('.', pos)
end
