require("set")
require("remap")

local nixCats = require('nixCats')
if not nixCats then
  require("pck")
end

DEFAULT_COLOR = "oh-lucy"
DEFAULT_BAR_COLOR = "none"

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
})

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
