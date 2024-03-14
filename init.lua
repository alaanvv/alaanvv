-- Appearence
vim.api.nvim_exec([[autocmd BufNewFile,BufRead *.h set filetype=c]], false)
vim.cmd('colorscheme gruvbox')
vim.o.cursorline = true
vim.o.showmode = false
vim.o.number = true
vim.o.ruler = false
vim.o.wrap = false
vim.o.sidescrolloff = 8
vim.o.scrolloff = 8
vim.o.numberwidth = 1
vim.o.cmdheight = 1
vim.o.showtabline = 0
vim.o.signcolumn = 'no'

-- Settings
vim.o.ignorecase = false
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.backup = false 
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.expandtab = true

-- Map
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('n', '<C-a>', 'gg0vG$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':bw!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', 'yyP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', 'yyp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Up>', 'ddkP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', 'ddp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<kMultiply>:%s///gc<Left><Left><Left>', { noremap = true, silent = true })
local run_c = ':terminal gcc script.c -o script -lm; ./script'
vim.api.nvim_set_keymap('n', '<leader>wc', run_c, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', run_c .. '<CR>', { noremap = true, silent = true })

-- Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'andweeb/presence.nvim',
  'catppuccin/nvim',
  'BurntSushi/ripgrep',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets'
})

-- Telescope
require('telescope').setup({defaults = {
  file_ignore_patterns = {'node_modules', 'package.json', 'package%-lock.json', '^[^.]*$', '.*.ppm', 'inc/', 'mod/', 'db'},
  path_display = function(opts, path)
    local tail = require('telescope.utils').path_tail(path)
    local display_path = path:gsub('^%./', ''):gsub('/', '.'):sub(1, -#tail - 2)
    if (tail ~= display_path) then return string.format('%s (%s)', tail, display_path)
    else return tail end
  end
}})

-- Discord rich presence
require('presence').setup({
    neovim_image_text = 'NeoVim',
    main_image = 'neovim',
    buttons = {{ label = 'Projects', url = 'https://www.github.com/alaanvv' }},
    show_time = true,

    editing_text = 'Coding %s',
    file_explorer_text = 'Browsing with %s',
    reading_text = 'At terminal'
})

-- Autocompletion 
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})
