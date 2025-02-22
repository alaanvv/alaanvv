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
    local utils     = require('telescope.utils')
    local actions = require('telescope.actions')
    local state = require('telescope.actions.state')

    local open_all = function(buf)
      local picker = state.get_current_picker(buf)
      local results = picker.finder.results

      for _, entry in ipairs(results) do
        vim.cmd('edit! ' .. entry[1])
      end
    end

    local mappings = {
      ['<C-h>'] = actions.close,
      ['<C-j>'] = actions.move_selection_next,
      ['<C-k>'] = actions.move_selection_previous,
      ['<C-l>'] = actions.select_default,
      ['<C-a>'] = open_all
    }

    telescope.setup({
      defaults = {
        mappings = {
          i = mappings,
          n = mappings
        }
      },

      extensions = {
        ['ui-select'] = {
          prompt_prefix   = '> ',
          selection_caret = '  ',

          results_title = '',

          layout_strategy = 'horizontal',
          layout_config = {
            preview_width = 0,
            width = 50,
            height = 25,
          }
        }
      },

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

          file_ignore_patterns = { 'node_modules', 'package.json', 'package%-lock.json', '^[^.]*$', '.*.ppm', '.*.png', '.*.jpg', '.*.jpeg', '.*.webp', 'inc', 'mod', 'db', 'obj/' },
          path_display = function(_, path)
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
    telescope.load_extension('ui-select')

    vim.keymap.set('n', '<leader>e', ':Telescope find_files <CR>')
    vim.keymap.set('n', '<leader>f', ':Telescope live_grep  <CR>')
  end
}
