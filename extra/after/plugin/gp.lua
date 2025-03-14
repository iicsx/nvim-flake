require("gp").setup({
  providers = {
    openai = {
      disable = true,
    },
    copilot = {
      disable = false,
      endpoint = "https://api.githubcopilot.com/chat/completions",
      secret = {
        "bash",
        "-c",
        "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
      },
    },
  }
})

function open_floating_window()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- get selected lines
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local win_config = {
    relative = 'cursor',
    row = (row >= #lines / 2 and -1 or 1),
    col = col + 3,
    width = 30,
    height = 1,
    style = 'minimal',
    title = ' Refactor ',
    border = 'rounded'
  }

  local buf = vim.api.nvim_create_buf(false, true)
  if not buf then
    return
  end

  vim.api.nvim_open_win(buf, true, win_config)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_command("startinsert")

  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':q!<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', '<Esc>:q!<CR>', { noremap = true, silent = true })

  vim.api.nvim_create_autocmd("BufWinLeave", {
    buffer = buf,
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      local input = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
      if not input or input == nil or input == "" then
        vim.notify("No input provided, discarding...", "warn")
        return
      end

      vim.schedule(function()
        vim.cmd(start_line .. "," .. end_line .. "GpRewrite " .. input)
      end)
    end,
  })
end

vim.keymap.set("v", "<leader>gp", function() open_floating_window() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gn", ":GpChatNew tabnew<CR>", { noremap = true })
