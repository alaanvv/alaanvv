function Statusline()
  local filepath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.') .. ' '
  local file_display = ''

  if filepath == '~ ' then
    file_display = ''
  else
    if vim.bo.modified then
      file_display = '%#Normal#' .. filepath .. '%#Statusline#'
    else
      file_display = filepath
    end
  end

  local levels = { e = 'Error', w = 'Warn', i = 'Info', h = 'Hint' }
  local count = {}

  for k, l in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = l }))
  end

  local lsp = ' '
  if count.e ~= 0           then lsp = lsp .. ' ' .. count.e           .. ' ' end
  if count.w ~= 0           then lsp = lsp .. '󰀦 ' .. count.w           .. ' ' end
  if count.h + count.i ~= 0 then lsp = lsp .. '󰌵 ' .. count.h + count.i .. ' ' end

  local buffer_display = ' 󰝤 ' .. vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val)')) .. ' '

  return file_display .. lsp .. '%= ' .. buffer_display
end

vim.cmd('autocmd WinEnter,WinLeave,BufEnter,BufLeave * setlocal statusline=%!v:lua.Statusline()', false)
