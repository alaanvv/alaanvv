local path = vim.fn.stdpath('config') .. '/data/colorscheme.json'

function Save_Colorscheme()
  vim.fn.system('touch ' .. path)
  vim.fn.writefile({ vim.g.colors_name }, path)
end

function Load_Colorscheme()
  if vim.fn.filereadable(path) == 0 then return end
  vim.cmd('colorscheme ' .. vim.fn.readfile(path)[1], false)
end

vim.cmd('autocmd Colorscheme * lua Save_Colorscheme()')
Load_Colorscheme()
