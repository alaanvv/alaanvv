vim.cmd('autocmd VimLeavePre * mksession! ' .. vim.fn.stdpath('config') .. '/data/session.vim')
