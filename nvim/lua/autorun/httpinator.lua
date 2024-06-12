local path = vim.fn.stdpath('config') .. '/httpinator.json'
local methods = { 'GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS', 'HEAD', 'CONNECT', 'TRACE' }

local function get_reqs()
  local reqs = {}

  vim.fn.system('touch ' .. path)
  local content = vim.fn.join(vim.fn.readfile(path))
  if content ~= '' then reqs = vim.json.decode(content) end

  return reqs
end

local function set_req(name, req)
  local reqs = get_reqs()
  reqs[name] = req

  vim.fn.system('touch ' .. path)
  vim.fn.writefile({ vim.json.encode(reqs) }, path)
end

local function input(prompt, placeholder, completion)
  function _Completion()
    if   type(completion) == 'table' then return completion
    else                                  return completion() end
  end

  placeholder = placeholder or ''
  if completion then return vim.fn.input(prompt, placeholder, 'customlist,v:lua._Completion')
  else               return vim.fn.input(prompt, placeholder) end
end

local function input_req()
  local reqs  = get_reqs()
  local names = {}
  for name, _ in pairs(reqs) do
    table.insert(names, name)
  end

  local name = input('> ', '', names)
  return { name, reqs[name] }
end

---

function HTTP_Create()
  local name   = input('Name: ')
  local url    = input('URL: ', '', { 'http://localhost:' })
  local method = input('Method: ', '', methods)
  if name == '' or url == '' or method == '' then return end

  set_req(name, { url = url, method = method })
end

function HTTP_Edit()
  local req_data = input_req()
  local name   = input('Name: ', req_data[1])
  local url    = input('URL: ', req_data[2].url)
  local method = input('Method: ', req_data[2].method, methods)
  if name == '' or url == '' or method == '' then return end

  set_req(name, { url = url, method = method })
end

function HTTP_Delete()
  set_req(input_req()[1], nil)
end

function HTTP_Run()
  local req_data = input_req()
  local name = req_data[1]
  local req  = req_data[2]

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  if req.json then vim.api.nvim_buf_set_lines(buf, 0, -1, false, req.json) end

  local function run()
    req.json = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    vim.api.nvim_buf_delete(buf, {})
    set_req(name, req)

    vim.cmd('terminal curl -s -X ' .. req.method .. ' -H "Content-Type: application/json" -d "' .. string.gsub(vim.fn.join(req.json), '"', '\\"') .. '" ' .. req.url)
  end

  vim.keymap.set('n', '<C-s>', run, { buffer = buf })
end

vim.cmd('command! HTTPinatorCreate lua HTTP_Create()')
vim.cmd('command! HTTPinatorEdit   lua HTTP_Edit()')
vim.cmd('command! HTTPinatorDelete lua HTTP_Delete()')
vim.cmd('command! HTTPinatorRun    lua HTTP_Run()')
