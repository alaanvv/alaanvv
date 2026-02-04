vim.keymap.set('n', '<C-t>', ':Oil<CR>')

return {
  'stevearc/oil.nvim',
  dependencies = { 'benomahony/oil-git.nvim' },
  lazy = false,

  config = function()
    require('oil').setup({
      delete_to_trash = true,
      keymaps = {
        ['<C-s>'] = false,
        ['l'] = 'actions.select',
        ['h'] = { 'actions.parent', mode = 'n' },
        ['<C-p>'] = { 'actions.preview', opts = { horizontal = true } }
      }
    })
    require('oil-git').setup({
      highlights = {
        OilGitModified  = { link = 'DiagnosticWarn' },
        OilGitAdded     = { link = 'DiagnosticOk' },
        OilGitRenamed   = { link = 'DiagnosticInfo' },
        OilGitUntracked = { link = 'DiagnosticHint' },
        OilGitIgnored   = { link = 'Comment' }
      }
    })
  end
}
