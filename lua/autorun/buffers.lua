function List_buffers()
  local cur = vim.api.nvim_get_current_buf()
  local chunks = {}

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t') or '<no name>'
      table.insert(chunks, { name .. '  ', buf == cur and '@comment.todo' or '@comment' })
    end
  end

  vim.api.nvim_echo(chunks, false, {})
end

vim.keymap.set('n', '<C-j>', ':bprev <CR>:lua List_buffers() <CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':bnext <CR>:lua List_buffers() <CR>', { silent = true })
vim.keymap.set('n', '<C-b>', ':bw!   <CR>:lua List_buffers() <CR>', { silent = true })
vim.keymap.set('n', '<C-s>', ':w!    <CR>:lua List_buffers() <CR>', { silent = true })
