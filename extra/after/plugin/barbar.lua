vim.g.barbar_auto_setup = false -- disable auto-setup

local easter_egg_icons = { '󰄛 ', '󰚾 ', '󱄅 ' }

local icons = { '󱓉 ', '󰐙 ', '󰀚 ', '󰎝 ', '󰆃 ', '󰕜 ' }

local function random_normal_icon()
  return icons[math.random(#icons)]
end

local function random_easter_egg_icon()
  return easter_egg_icons[math.random(#easter_egg_icons)]
end

local function get_random_icon()
  if math.random(7) == 3 then
    return random_easter_egg_icon()
  end

  return random_normal_icon()
end

require('barbar').setup({
  icons = {
    buffer_number = true,
    separator = { left = '', right = '' },
    modified = { button = get_random_icon() },
    filetype = {
      enabled = true
    },
  },
  -- order by buffer id
  sort_by = 'id',
})

vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = 'NONE' })

-- auto command when adding a  new buffer to run BufferOrderByBufferNumber
vim.api.nvim_create_autocmd('BufAdd', {
  group = vim.api.nvim_create_augroup('BufferLine', { clear = true }),
  callback = function()
    vim.cmd('BufferOrderByBufferNumber')
  end,
})
