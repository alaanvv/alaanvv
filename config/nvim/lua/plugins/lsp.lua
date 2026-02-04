vim.keymap.set('i', '<C-g>', '<C-x><C-o>')
vim.keymap.set('i', '<C-j>', 'pumvisible() ? \'<C-n>\' : \'<C-n>\'', { expr = true })
vim.keymap.set('i', '<C-k>', 'pumvisible() ? \'<C-p>\' : \'<C-p>\'', { expr = true })
vim.keymap.set('i', '<C-h>', 'pumvisible() ? \'<C-e>\' : \'<C-h>\'', { expr = true })
vim.keymap.set('i', '<C-l>', 'pumvisible() ? \'<C-y>\' : \'<C-l>\'', { expr = true })
vim.keymap.set('n', '<leader>E', ':lua vim.diagnostic.goto_next() <CR>')
vim.keymap.set('n', '<C-p>', vim.lsp.buf.hover)
vim.keymap.set('n', '<A-f>', vim.lsp.buf.format)
vim.keymap.set('n', '<C-c>', vim.lsp.buf.rename)
vim.keymap.set('n', '<C-f>', vim.lsp.buf.references)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action)

vim.api.nvim_create_autocmd('CursorHold', {
  desc = 'Show diagnostics on hover',
  pattern = '*',
  callback = function()
    if #vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 }) == 0 then return end
    vim.diagnostic.open_float(nil, { close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' } })
  end
})

vim.diagnostic.config({
  float = {
    header = '',
    prefix = '',
    border = 'solid',
    source = false,
    focusable = false
  }
})

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  },

  'neovim/nvim-lspconfig'
}
