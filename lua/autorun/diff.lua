if not vim.wo.diff then return end

---@diagnostic disable-next-line: undefined-field
vim.opt.fillchars:append({ diff = ' ', fold = ' ' })
vim.o.diffopt = 'internal,filler,closeoff,linematch:40,foldcolumn:0'
vim.o.number = false

vim.keymap.set('n', 'ZZ', ':qall <CR>')
