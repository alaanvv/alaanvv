vim.keymap.set('n', '<leader>hh', ':Gitsigns preview_hunk <CR>')
vim.keymap.set('n', '<leader>hp', ':Gitsigns prev_hunk    <CR>')
vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk    <CR>')

return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      numhl = true,
      current_line_blame = true
    })
  end
}
