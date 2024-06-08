local checkpoints = {}

function Checkpoint()
  local filename = vim.fn.expand('%')
  if checkpoints[filename] then
    vim.fn.setpos('.', checkpoints[filename])
    checkpoints[filename] = nil
  else
    checkpoints[filename] = vim.fn.getpos('.')
    print('Checkpoint: ' .. vim.fn.getpos('.')[2])
  end
end

vim.keymap.set('n', 'S', Checkpoint, {})
