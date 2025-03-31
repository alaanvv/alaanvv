LSPs = { 'pyright', 'ast_grep', 'clangd', 'ts_ls', 'lua_ls', 'html', 'cssls', 'tailwindcss', 'cssmodules_ls', 'css_variables', 'svelte' }

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
        ensure_installed = LSPs
      }
    end
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp_config = require('lspconfig')

      for _, lsp in ipairs(LSPs) do
        lsp_config[lsp].setup {}
      end

      lsp_config.html.setup {
        settings = { html = { validate = false } }
      }

      vim.keymap.set('n', '<C-p>', vim.lsp.buf.hover,      {})
      vim.keymap.set('n', '<A-f>', vim.lsp.buf.format,     {})
      vim.keymap.set('n', '<C-c>', vim.lsp.buf.rename,     {})
      vim.keymap.set('n', '<C-f>', vim.lsp.buf.references, {})
      vim.keymap.set('n', 'gd',    vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, {})

      vim.api.nvim_create_autocmd('CursorHold', {
        pattern = '*',
        desc = 'Show diagnostics on hover',
        callback = function()
          if #vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 }) > 0 then
            vim.diagnostic.open_float()
          end
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

    end
  }
}


