local json = require("dkjson")
local utils = require("utils")

print(utils.is_module_installed("nixCats"))
print(utils.is_module_installed("dkjson"))
print(utils.isNixCats)

local handle = io.popen("nix flake metadata --json")
local result = handle:read("*a")
handle:close()

local flake_data, _, err = json.decode(result)
if not flake_data then
  print("Error parsing JSON: ", err)
else
  -- for key, value in pairs(flake_data) do
  --   print(key, value)
  -- end
end
