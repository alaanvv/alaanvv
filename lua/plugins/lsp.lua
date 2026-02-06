vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>E', vim.diagnostic.goto_next)
vim.keymap.set('n', '<C-f>', vim.lsp.buf.references)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<A-f>', vim.lsp.buf.format)
vim.keymap.set('n', '<C-c>', vim.lsp.buf.rename)
vim.keymap.set('n', '<C-p>', vim.lsp.buf.hover)
vim.keymap.set('i', '<C-g>', '<C-x><C-o>')

vim.diagnostic.config({ virtual_text = true })

return {
  'neovim/nvim-lspconfig',
  {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function() require('mason-lspconfig').setup() end
  },
}
