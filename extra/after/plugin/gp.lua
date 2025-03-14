local noice = require('noice')

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

vim.keymap.set("v", "<leader>gp", ":GpRewrite ", { noremap = true })
vim.keymap.set("n", "<leader>gn", ":GpChatNew tabnew<CR>", { noremap = true })
