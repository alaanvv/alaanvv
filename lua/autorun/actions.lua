vim.keymap.set('n', '<leader><leader><leader>', ':lua Actions_pick() <CR>')

function Actions_pick()
  vim.ui.select(vim.tbl_keys(Actions), {}, function(choice)
    if choice then
      Actions[choice]()
    end
  end)
end
