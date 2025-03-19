local function module_exists(name)
    local ok, _ = pcall(require, name)

    return ok
end

local with_cats = module_exists("nixCats")
if not nixCats then
  require("pck")
end

require("set")
require("remap")

DEFAULT_COLOR = "oh-lucy"
DEFAULT_BAR_COLOR = "none"

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
})

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
