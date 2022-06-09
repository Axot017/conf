local M = {}

local function read_file(path)
  local file = io.open(path, "rb")
  if not file then return nil end
  local content = file:read "*a"
  file:close()
  return content
end

local function decode(content)
  local ok, lunajson = pcall(require, 'lunajson')

  if not ok then
    vim.notify('lunajson not installed')
    return {}
  end

  return lunajson.decode(content)
end

local function read_config()
  local root = vim.loop.cwd()
  local config_path = root .. '/.nvim/launch.json'

  local content = read_file(config_path)
  if not content then
    vim.notify('File "' .. config_path .. '" not found')
    return {}
  end

  local json = decode(content)
  local configs = json.configs
  local global = json.global
  if not global then
    global = {}
  end

  local result = {}

  for index, config in pairs(configs) do
    local new = {}
    for k, v in pairs(global) do
      new[k] = v
    end

    for k, v in pairs(config) do
      new[k] = v
    end

    for k, v in pairs(new) do
      if type(v) == 'string' then
        new[k] = string.gsub(v, "${project_dir}", root)
      else
        new[k] = v
      end
    end
    result[index] = new
  end

  return result
end

M.read_config = read_config

return M
