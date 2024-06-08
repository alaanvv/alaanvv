vim.cmd('autocmd BufWritePre * lua Clear_trailing_space()')

function Clear_trailing_space()
  local pos = vim.fn.getpos('.')
  vim.cmd('%s/\\s\\+$//e')
  vim.fn.setpos('.', pos)
end
