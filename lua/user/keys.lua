-- [[ keys.lua ]]
local map = require("user.utils").map

-- Remap space as leader key
map("", ",<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ vim.g.snippets = "luasnip" ]]

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

-- resize panes
map("n", "<C-=>", ":vertical resize +5<CR>", {})
map("n", "<C-->", ":vertical resize -5<CR>", {})

-- Settings --
vim.api.nvim_exec(
	[[
      let g:rainbow_active = 1

      cnoreabbrev le Lexplore 10

      " blinking cursor
      set guicursor=n-v-c:block,i-ci-ve:ver35,r-cr:hor25,o:hor50
      \,a:blinkwait50-blinkoff200-blinkon200-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

  ]],
	false
)

-- Navigate buffers
-- map("n", "<A-j>", ":bnext<CR>", {})
-- map("n", "<A-k>", ":bprevious<CR>", {})
vim.api.nvim_set_keymap("n", "<A-j>", ":CtrlSpaceGoDown<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":CtrlSpaceGoUp<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>v", ":buffers<CR>:b")
-- vim.keymap.set("n", "<A-b>", ":CtrlSpace<CR>")
map("n", "<A-b> ", ":CtrlSpace<CR>", {})
-- Navigate tabs
map("n", "<A-l>", ":tabnext<CR>", {})
map("n", "<A-h>", ":tabprevious<CR>", {})

-- Example: Remap <Leader>b to CtrlSpaceDefaultMappingKey in normal mode
vim.api.nvim_set_keymap("n", "<leader>b", ":CtrlSpaceDefaultMappingKey<CR>", { silent = true })

-- Toggle between relative and fixed line nu
-- local rnu = true

map("n", "<leader>r", ":set rnu<CR>", {})
map("n", "<leader>d", ":set nornu<CR>", {})

-- if rnu then
-- 	map("n", "<leader>r", ":set nornu<CR>", {})
-- 	rnu = false
-- else
-- 	map("n", "<leader>r", ":set rnu<CR>", {})
-- 	rnu = true
-- end

-- Re-sources your key mappings… helpful for testing out remapping of keys
map("n", "<leader>rv", ":source ~/.config/nvim/init.lua<CR>", {})
map("n", "<leader>ls", ":source ~/.config/nvim/lua/user/snips/configs.lua<CR>", {})
map("n", "<leader>av", ":tabnew ~/.config/nvim/init.lua<CR>", {})
map("n", "<leader>tt", ":NvimTreeOpen ~/Documents/dev/template/solidity/<CR>", {})
map("n", "<leader>ss", ":NvimTreeOpen ~/.config/nvim/lua/user/snips/luasnippets/<CR>", {})
map("n", "<leader>oa", ":tabnew ~/.config/nvim/lua/user/snips/luasnippets/all.lua<CR>", {})
map("n", "<leader>ol", ":tabnew ~/.config/nvim/lua/user/snips/luasnippets/lua.lua<CR>", {})
map("n", "<leader>om", ":tabnew ~/.config/nvim/lua/user/snips/luasnippets/markdown.lua<CR>", {})
map("n", "<leader>ob", ":tabnew ~/.config/nvim/lua/user/snips/luasnippets/boilerplate.lua<CR>", {})
map("n", "<leader>os", ":tabnew ~/.config/nvim/lua/user/snips/luasnippets/solidity.lua<CR>", {})
map("n", "<leader>oj", ":tabnew ~/.config/nvim/lua/user/snips/luasnippets/javascript.lua<CR>", {})

-- Stay in indent mode
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- keep copied yank in v
map("v", "p", '"_dP', {})
map("n", "<C-s>", ":w<cr>", {})
map("n", "gb", ":b#<cr>", {})

-- very magic
-- map("n", "/", "/\v", {})
-- map("v", "/", "/\v", {})

-- fix Y behaviour
vim.keymap.set("n", "Y", "y$")

-- 'Q' in normal mode enters Ex mode.  Remap to break text to new lines
map("n", "Q", "gq", {})
-- add line above in insert mode
map("i", "OO", "<Esc>O", {})

-- Nvimtree
map("n", "<leader>e", ":NvimTreeToggle<cr>", {})
