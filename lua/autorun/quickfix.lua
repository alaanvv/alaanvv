function Qf_text(info)
  local items = vim.fn.getqflist({ id = info.id, items = 0 }).items
  local out, max = {}, 0

  for i = info.start_idx, info.end_idx do
    local fname = vim.fn.fnamemodify(items[i].bufnr > 0 and vim.fn.bufname(items[i].bufnr) or '', ':t')
    max = math.max(max, #fname)
  end

  for i = info.start_idx, info.end_idx do
    local fname = vim.fn.fnamemodify(items[i].bufnr > 0 and vim.fn.bufname(items[i].bufnr) or '', ':t')
    local text = (items[i].text or ''):gsub('^%s+', '')
    table.insert(out, string.format('%-' .. max .. 's | %s', fname, text))
  end

  return out
end

vim.o.quickfixtextfunc = 'v:lua.Qf_text'
