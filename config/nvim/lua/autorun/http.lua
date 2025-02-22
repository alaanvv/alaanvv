local path = vim.fn.stdpath('config') .. '/http.json'
vim.fn.system('touch ' .. path)
local last

--

local function get_reqs(name)
  local reqs = {}

  local content = vim.fn.join(vim.fn.readfile(path))
  if content ~= '' then reqs = vim.json.decode(content) end

  if name then return reqs[name]
  else         return reqs end
end

local function set_req(name, req)
  local reqs = get_reqs()
  reqs[name] = req

  vim.fn.writefile({ vim.json.encode(reqs) }, path)
end

-- Autocomplete stuff
local methods = { 'GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS', 'HEAD', 'CONNECT', 'TRACE' }

local function req_names()
  local names = {}
  for name, _ in pairs(get_reqs()) do table.insert(names, name) end
  table.sort(names)
  return names
end

--

local function input(prompt, placeholder, completion)
  function _Completion() return completion end

  placeholder = placeholder or ''
  if completion then return vim.fn.input(prompt, placeholder, 'customlist,v:lua._Completion')
  else               return vim.fn.input(prompt, placeholder) end
end

--

local function call_curl(name)
  local req  = get_reqs(name)
  vim.cmd('terminal curl -s -X ' .. req.method .. ' -H "Content-Type: application/json" -d "' .. string.gsub(vim.fn.join(req.json), '"', '\\"') .. '" ' .. req.url)
end

local function set_json(name, callback)
  local req = get_reqs(name)
  local placeholder = req.json
  if not placeholder then placeholder = { '{', '', '}' } end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, placeholder)

  local function run()
    req.json = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    vim.api.nvim_buf_delete(buf, {})
    set_req(name, req)
    callback()
  end

  vim.keymap.set('n', '<C-s>', run, { buffer = buf })
end

local function run_req(name)
  if not name then return end
  last = name

  local function run()
    call_curl(name)
  end

  set_json(name, run)
end

--

function HTTP_Create()
  local urls = {}
  for _, req in pairs(get_reqs()) do table.insert(urls, req.url) end

  local name   = input('Name: ')
  local url    = input('URL: ', '', urls)
  local method = input('Method: ', '', methods)
  if name == '' or url == '' or method == '' then return end

  set_req(name, { url = url, method = method })
  if input('Run (y/N): ') == 'y' then run_req(name) end
end

function HTTP_Edit()
  vim.ui.select(req_names(), { prompt = '~req~' }, function(choice)
    local req    = get_reqs(choice)
    local name   = input('Name: ', choice)
    local url    = input('URL: ', req.url)
    local method = input('Method: ', req.method, methods)
    if name == '' or url == '' or method == '' then return end

    set_req(choice, nil)
    set_req(name, { url = url, method = method, json = req.json })
    if input('Run (y/N): ') == 'y' then run_req(name) end
  end)
end

function HTTP_Delete()
  vim.ui.select(req_names(), { prompt = '~req~' }, function(choice)
    set_req(choice, nil)
  end)
end

function HTTP_Run()
  vim.ui.select(req_names(), { prompt = '~req~' }, function(choice)
    run_req(choice)
  end)
end

function HTTP_Run_Last()
  call_curl(last)
end

--

function HTTP()
  vim.ui.select({ 'create', 'edit', 'delete', 'run', 'run-last' }, { prompt = '~http~' }, function(choice)
    if     choice == 'create'   then HTTP_Create()
    elseif choice == 'edit'     then HTTP_Edit()
    elseif choice == 'delete'   then HTTP_Delete()
    elseif choice == 'run'      then HTTP_Run()
    elseif choice == 'run-last' then HTTP_Run_Last()
    end
  end)
end

vim.keymap.set('n', '<leader>h', HTTP)
