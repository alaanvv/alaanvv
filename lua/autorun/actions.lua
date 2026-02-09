vim.keymap.set('n', '<leader><leader><leader>', ':lua Actions_pick() <CR>')

function Actions_pick()
  vim.ui.select(vim.tbl_keys(Actions), {}, function(choice)
    if choice then
      Actions[choice]()
    end
  end)
end

-- General actions

Actions['Use tabs'] = function()
  vim.o.expandtab = false
end

Actions['Use spaces'] = function()
  vim.o.expandtab = true
end
