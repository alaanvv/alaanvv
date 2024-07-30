function Workspace()
  local content = {}

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)

  ---

  local function update(track)
    content = vim.split(vim.fn.system('ls --group-directories-first -p -a'), '\n')
    table.remove(content)
    table.remove(content, 1)
    table.remove(content, 1)

    vim.api.nvim_buf_set_option(buf, 'modifiable', true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)

    if track then
      for i, v in ipairs(content) do
        if v == track then
          vim.cmd(':' .. i)
        end
      end
    end
  end

  local function delete()
    vim.fn.system('rm -rf ' .. content[vim.fn.getpos('.')[2]])

    update()
  end

  local function duplicate()
    local selected = content[vim.fn.getpos('.')[2]]
    local input = vim.fn.input('> ', selected)

    vim.fn.system('cp -r ' .. selected .. ' ' .. input)

    update(input)
  end

  local function rename()
    local selected = content[vim.fn.getpos('.')[2]]
    local input = vim.fn.input('> ', selected)

    vim.fn.system('mv ' .. selected .. ' ' .. input)

    update(input)
  end

  local function create()
    local input = vim.fn.input('> ')

    if input:sub(-1) == '/' then
      vim.fn.system('mkdir ' .. input)
    else
      vim.fn.system('touch ' .. input)
    end

    update(input)
  end

  local function enter()
    local selected = content[vim.fn.getpos('.')[2]]
    if selected:sub(-1) == '/' then
      vim.cmd('cd ' .. selected)
    else
      vim.cmd('e ' .. selected)
    end

    update()
  end

  local function exit()
    local from = vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. '/'
    vim.cmd('cd ..')

    update(from)
  end

  update()

  ---

  vim.keymap.set('n', 'dd', delete,    { buffer = buf })
  vim.keymap.set('n', 'yy', duplicate, { buffer = buf })
  vim.keymap.set('n', 'r',  rename,    { buffer = buf })
  vim.keymap.set('n', 'o',  create,    { buffer = buf })
  vim.keymap.set('n', 'l',  enter,     { buffer = buf })
  vim.keymap.set('n', 'h',  exit,      { buffer = buf })
end

vim.keymap.set('n', '<C-t>', Workspace, {})
