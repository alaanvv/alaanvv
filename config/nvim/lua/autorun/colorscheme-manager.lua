local path = vim.fn.stdpath('config') .. '/colorscheme.json'

function Save_colorscheme()
  vim.fn.system('touch ' .. path)
  vim.fn.writefile({ vim.json.encode({ colorscheme = vim.g.colors_name }) }, path)
end

function Load_colorscheme()
  if vim.fn.filereadable(path) == 0 then return end
  vim.cmd('colorscheme ' .. vim.json.decode(vim.fn.join(vim.fn.readfile(path))).colorscheme, false)
end

function Clear_themes()
  local themes_to_remove = {
    'blue', 'darkblue', 'delek', 'morning', 'ron',
    'sorbet', 'torte', 'wildcharm', 'zaibatsu'
  }

  for _, alt_path in ipairs(vim.api.nvim_list_runtime_paths()) do
    for _, theme in ipairs(themes_to_remove) do
      vim.cmd('silent !rm ' .. alt_path .. '/colors/' .. theme .. '.vim')
    end
  end
end

vim.cmd('autocmd Colorscheme * lua Save_colorscheme()')
Load_colorscheme()
