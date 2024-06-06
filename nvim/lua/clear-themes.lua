function clear_themes()
  local themes_to_remove = { 
    'blue', 'darkblue', 'delek', 'morning', 'ron', 
    'sorbet', 'torte', 'wildcharm', 'zaibatsu' 
  }

  for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
    for _, theme in ipairs(themes_to_remove) do
      vim.cmd('silent !rm ' .. path .. '/colors/' .. theme .. '.vim')
    end
  end
end
