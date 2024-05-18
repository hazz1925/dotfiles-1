-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.keys.normal_mode["vv"] = ":vsplit<CR>"
-- lvim.keys.normal_mode["<C-h>"] = "<C-w>h"

-- vim test key bind
lvim.keys.normal_mode[",tn"] = ':TestNearest<CR>'
lvim.keys.normal_mode[",tf"] = ':TestFile<CR>'
lvim.keys.normal_mode[",ts"] = ':TestSuite<CR>'
lvim.keys.normal_mode[",tl"] = ':TestLast<CR>'
lvim.keys.normal_mode[",ta"] = ':TestAll<CR>'

lvim.plugins = {
  { 'alexghergh/nvim-tmux-navigation', config = function()
        require'nvim-tmux-navigation'.setup {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
                last_active = "<C-\\>",
                next = "<C-Space>",
            }
        }
    end
  },
  { 'preservim/vimux', config = function()
--    print('vimux setup')
  end },
  { 'vim-test/vim-test', config = function()
--    print('vim test setup')
--    require'vim-test'.setup()
  end
  },
  -- { 'github/copilot.vim' },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}


-- Configure vim-test to use vimux as the runner
vim.g["test#strategy"] = "vimux"
-----------------------

-- Configuration for copilot
-- from https://medium.com/aimonks/a-guide-to-integrating-lunarvim-github-copilot-61d92f764913
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
--------------------------
