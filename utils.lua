local M = {}

function M.isModuleAvailable(name)
  if package.loaded[name] then
    return true
  end

  for _, searcher in ipairs(package.searchers or package.loaders) do
    local loader = searcher(name)
    print(loader)

    if type(loader) == 'function' then
      -- package.preload[name] = loader

      return true
    end
  end

  return false
end

function M.want()
  local out; if xpcall(
        function() out = require(name) end,
        function(e) out = e end)
  then
    return true
  else
    return false
  end
end

function M.is_module_installed(name)
  local ok, _ = pcall(require, name)
  return ok
end

M.isNixCats = vim.g[ [[nixCats-special-rtp-entry-nixCats]] ] ~= nil

return M
