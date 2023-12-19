-- My Neovim config

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'andweeb/presence.nvim' })

-- Appearence
vim.cmd('colorscheme gruvbox')
vim.o.number = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.cmdheight = 1
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.numberwidth = 1
vim.o.signcolumn = 'no'
vim.o.ruler = false

-- Identation
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Search
vim.o.ignorecase = false

-- Explorer
vim.o.wildignore = 'node_modules/,package.json,package-lock.json'

require('telescope').setup({defaults = {
  file_ignore_patterns = {'node_modules', 'package.json', 'package%-lock.json'},
  path_display = function(opts, path)
    local tail = require('telescope.utils').path_tail(path)
    local display_path = path:gsub('^%./', ''):gsub('/', '.'):gsub('.' .. tail, '')
    if (tail ~= display_path) then return string.format('%s (%s)', tail, display_path)
    else return tail end
  end
}})

-- Map
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<C-a>', 'gg0vG$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':bw!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', 'yyP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', 'yyp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Up>', 'ddkP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', 'ddp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nf', '<C-w><C-w><Down><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<kMultiply>:%s///gc<Left><Left><Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':!cat | xclip -select clipboard<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>js', ':terminal node --watch index.js<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':terminal gcc script.c -o script -lm -lSDL2; ./script<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wc', ':terminal gcc script.c -o script -lm -lSDL2; ./script', { noremap = true, silent = true })

-- Backup
vim.o.backup = false 
vim.o.writebackup = false
vim.o.swapfile = false

-- Text
vim.o.expandtab = true

-- Discord rich presence
require('presence').setup({
    neovim_image_text = 'NeoVim',
    main_image = 'neovim',
    buttons = {{ label = 'Projects', url = 'https://www.github.com/alaanvv' }},
    show_time = false,

    editing_text = 'Coding %s',
    file_explorer_text = 'Browsing with %s',
    reading_text = 'At terminal'
})
