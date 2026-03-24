if not vim.wo.diff then return end

vim.o.diffopt = 'internal,filler,closeoff,linematch:40,foldcolumn:0,iwhiteall'
vim.o.number = false

vim.keymap.set('n', 'ZZ', ':qall <CR>')
