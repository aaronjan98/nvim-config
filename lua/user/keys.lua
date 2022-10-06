-- [[ keys.lua ]]
local map = require("user.utils").map

-- Remap space as leader key
map("", ",<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})

-- Settings --
vim.api.nvim_exec(
  [[
      cnoreabbrev le Lexplore 10

      " blinking cursor
      set guicursor=n-v-c:block,i-ci-ve:ver35,r-cr:hor25,o:hor50
      \,a:blinkwait50-blinkoff200-blinkon200-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175
  ]],
  false
)

-- Navigate buffers
map("n", "<A-j>", ":bnext<CR>", {})
map("n", "<A-k>", ":bprevious<CR>", {})
vim.keymap.set('n', '<Leader>v', ':buffers<CR>:b')

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- keep copied yank in v
map("v", "p", '"_dP', {})

-- fix Y behaviour
vim.keymap.set('n', 'Y', 'y$')

vim.keymap.set('n', '<C-l>', ':nohl<CR>', {}) -- clear highlight
-- 'Q' in normal mode enters Ex mode.  Remap to break text to new lines
map('n', 'Q', 'gq', {})
-- add line above in insert mode
map('i', 'OO', '<Esc>O', {})

