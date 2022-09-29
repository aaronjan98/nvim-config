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

-- map("x", ":lex", ":Lexplore 30", {})

-- Navigate buffers
map("n", "<A-j>", ":bnext<CR>", {})
map("n", "<A-k>", ":bprevious<CR>", {})

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- keep copied yank in v
map("v", "p", '"_dP', {})
