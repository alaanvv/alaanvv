vim.keymap.set('n', '<leader>e', ':Telescope find_files <CR>')
vim.keymap.set('n', '<leader>f', ':Telescope live_grep  <CR>')

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep'
  },

  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        layout_config         = {
          width         = 0.9,
          preview_width = 0.6
        },

        dynamic_preview_title = true,
        prompt_prefix         = '> ',
        selection_caret       = '  ',
        prompt_title          = '',
        path_display          = { 'tail' },
      },

      pickers = {
        find_files = {
          results_title        = '~files~',
          file_ignore_patterns = { 'node_modules' }
        },

        colorscheme = {
          results_title  = '~colorscheme~',
          enable_preview = true
        }
      }
    })

    telescope.load_extension('ui-select')
  end
}
