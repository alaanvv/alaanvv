function Show_Buffers()
  local buffer_names = {}

  for _, buf in ipairs(vim.fn.range(1, vim.fn.bufnr('$'))) do
    if vim.fn.buflisted(buf) == 1 then
      table.insert(buffer_names, vim.fn.bufname(buf))
    end
  end

  while buffer_names[1] ~= vim.fn.bufname() do
    table.insert(buffer_names, table.remove(buffer_names, 1))
  end

  for i, name in ipairs(buffer_names) do
    if name == '' then
      buffer_names[i] = '[blank]'
    end
  end

  print(table.concat(buffer_names, ' 󰝤 '))
end
