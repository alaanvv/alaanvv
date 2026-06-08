vim.keymap.set('n', '<leader><leader>', ':lua Actions_pick() <CR>')

function Actions_pick()
  vim.ui.select(vim.tbl_keys(Actions), {}, function(choice)
    if choice then
      Actions[choice]()
    end
  end)
end

-- General actions

Actions['Run program'] = function()
  vim.cmd('terminal sh run.sh')
end

Actions['Use tabs'] = function()
  vim.o.expandtab = false
end

Actions['Use spaces'] = function()
  vim.o.expandtab = true
end

Actions['Wrap'] = function()
  vim.o.wrap = true
  vim.o.linebreak = true
end

Actions['No wrap'] = function()
  vim.o.wrap = false
  vim.o.linebreak = false
end
