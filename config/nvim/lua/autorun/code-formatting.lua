vim.cmd('autocmd BufWritePre * lua Clear_Trailing_Space()')

function Clear_Trailing_Space()
  local pos = vim.fn.getpos('.')
  vim.cmd('%s/\\s\\+$//e')
  vim.fn.setpos('.', pos)
end
