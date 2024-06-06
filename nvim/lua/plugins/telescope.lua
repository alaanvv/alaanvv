
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep'
  },

  config = function()
    local telescope = require('telescope')
    local builtin   = require('telescope.builtin')
    local utils     = require('telescope.utils')

    telescope.setup({
      pickers = { 
        find_files = {
          prompt_prefix   = '> ',
          selection_caret = '  ',

          prompt_title    = '',
          preview_title   = '',
          results_title   = '~files~',

          layout_strategy = 'horizontal',     
          layout_config = {
            preview_width = 0.65,
          },

          file_ignore_patterns = { 'node_modules', 'package.json', 'package%-lock.json', '^[^.]*$', '.*.ppm', 'inc', 'mod', 'db', 'obj' },
          path_display = function(opts, path)
            local tail = utils.path_tail(path)
            local display_path = path:gsub('^%./', ''):gsub('/', '.'):sub(1, -#tail - 2)
            if (#display_path > 0) then return string.format('%s (%s)', tail, display_path)
            else return tail end
          end
        },

        colorscheme = {
          prompt_prefix   = '> ',
          selection_caret = '  ',

          enable_preview = true,
          prompt_title = '',
          results_title = '~colorscheme~',

          layout_strategy = 'horizontal',     
          layout_config = {
            preview_width = 0,
            width = 25,
            height = 5 + #vim.fn.getcompletion('', 'color'),
          }
        }
      }
    })

    vim.keymap.set('n', '<leader>e', ':Telescope find_files <CR>')
    vim.keymap.set('n', '<leader>f', ':Telescope live_grep  <CR>')
  end
}
