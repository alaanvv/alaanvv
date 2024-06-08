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
      require('mason-lspconfig').setup {
        ensure_installed = { 'clangd', 'tsserver', 'lua_ls', }
      }
    end
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp_config = require('lspconfig')
      lsp_config.clangd.setup {}
      lsp_config.tsserver.setup {}
      lsp_config.lua_ls.setup {}

      vim.keymap.set('n', '<C-p>',          vim.lsp.buf.hover,        {})
      vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,   {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
