vim.keymap.set('n', '<C-t>', ':Oil<CR>')

return {
  'stevearc/oil.nvim',
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
  end
}
