-- Setup
local path = vim.fn.stdpath('config') .. '/http.json'
vim.fn.system('touch ' .. path)
local reqs
local last

local content = vim.fn.join(vim.fn.readfile(path))
if content ~= '' then reqs = vim.json.decode(content) end

-- Autocomplete
local methods = { 'GET', 'POST', 'PUT', 'DELETE' }

local function req_names()
  local names = {}
  for name, _ in pairs(reqs) do table.insert(names, name) end
  return names
end

local function req_urls()
  local urls = {}
  local seen = {}
  for _, req in pairs(reqs) do
    if not seen[req.url] then
      table.insert(urls, req.url)
      seen[req.url] = true
    end
  end
  return urls
end

-- Utils
local function input(prompt, placeholder, completion)
  function _Completion() return completion end

  placeholder = placeholder or ''
  if completion then return vim.fn.input(prompt, placeholder, 'customlist,v:lua._Completion')
  else               return vim.fn.input(prompt, placeholder) end
end

-- 

local function set_req(name, req)
  reqs[name] = req
  vim.fn.writefile({ vim.json.encode(reqs) }, path)
end

--

local function call_curl(name)
  local req = reqs[name]

  local json_path = vim.fn.stdpath('data') .. '/req.json'
  vim.fn.writefile(req.json, json_path)

  local cmd = string.format([[curl -s -X %s -H 'Content-Type: application/json' -H 'Authorization: %s' -d @%s '%s%s' | jq]], req.method, req.auth, json_path, req.url, req.tail)
  print(string.format('%s%s', req.url, req.tail))

  local output = vim.fn.system(cmd)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, '\n'))
  vim.bo.filetype = 'json'
end

local function run_req(name)
  local req = reqs[name]
  last = name

  if req.use_tail then
    req.tail = string.gsub(input('Tail: ', req.tail), ' ', '%20')
  else
    req.tail = ''
  end

  if req.method == 'GET' then
    set_req(name, req)
    return call_curl(name)
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, req.json or { '{', '', '}' })

  local function run()
    req.json = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    vim.api.nvim_buf_delete(buf, {})
    set_req(name, req)
    call_curl(name)
  end

  vim.keymap.set('n', '<C-s>', run, { buffer = buf })
end

--

function HTTP_Create()
  local name = input('Name: ')
  if name == '' then return end

  local url = input('URL: ', '', req_urls())
  if url == '' then return end

  local method = input('Method: ', '', methods)
  if method == '' then return end

  local use_tail = input('Use Tail (Y/n): ', '', methods) ~= 'n'

  local auth = input('Auth: ')

  set_req(name, { url = url, method = method, auth = auth, use_tail = use_tail })
  if input('Run (Y/n): ') ~= 'n' then run_req(name) end
end

function HTTP_Edit()
  vim.ui.select(req_names(), { prompt = '~req~' }, function(choice)
    local req = reqs[choice]

    local name = input('Name: ', choice)
    if name == '' then return end

    req.url = input('URL: ', req.url)
    if req.url == '' then return end

    req.method = input('Method: ', req.method, methods)
    if req.method == '' then return end

    req.use_tail = input('Use Tail (Y/n): ', '', methods) ~= 'n'

    req.auth = input('Auth: ', req.auth)

    set_req(choice, nil)
    set_req(name, req)
    if input('Run (Y/n): ') ~= 'n' then run_req(name) end
  end)
end

function HTTP_Delete()
  vim.ui.select(req_names(), { prompt = '~req~' }, function(choice)
    set_req(choice, nil)
  end)
end

function HTTP_Run()
  vim.ui.select(req_names(), { prompt = '~req~' }, function(choice)
    if choice then run_req(choice) end
  end)
end

function HTTP_Run_Last()
  if not last then print('No request')
  else call_curl(last) end
end

--

function HTTP()
  local options = { 'run', 'run-last', 'create', 'edit', 'delete' }
  if not last then table.remove(options, 2) end

  vim.ui.select(options, { prompt = '~http~' }, function(choice)
    if     choice == 'create'   then HTTP_Create()
    elseif choice == 'edit'     then HTTP_Edit()
    elseif choice == 'delete'   then HTTP_Delete()
    elseif choice == 'run'      then HTTP_Run()
    elseif choice == 'run-last' then HTTP_Run_Last()
    end
  end)
end
