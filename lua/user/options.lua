--[[ options.lua ]]
local options = vim.opt

options = {
	-- [[ Context ]]
	number = true,                            -- bool: Show line numbers
	relativenumber = true,                    -- bool: Show relative line numbers
	scrolloff = 3,                            -- int:  Min num lines of context
	sidescrolloff = 8,
  signcolumn = "no",                       -- always show the sign column, otherwise it would shift the text each time
	clipboard = "unnamedplus",                -- allows neovim to access the system clipboard
	completeopt = { "menuone", "noselect" },  -- mostly just for cmp

	-- [[ Execution ]]
	timeoutlen = 500,                         -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                          -- enable persistent undo
	updatetime = 300,                         -- faster completion (4000ms default)
	writebackup = false,                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

	-- [[ Filetypes ]]
	encoding = 'utf8',                        -- str:  String encoding to use
	fileencoding = 'utf8',                    -- str:  File encoding to use
	conceallevel = 0,                         -- so that `` is visible in markdown files

	-- [[ Theme ]]
	syntax = "ON",                            -- str:  Allow syntax highlighting
	termguicolors = true,                     -- bool: If term supports ui color then enable

	-- [[ Search ]]
	ignorecase = true,                        -- bool: Ignore case in search patterns
	smartcase = true,                         -- bool: Override ignorecase if search contains capitals
	incsearch = true,                         -- bool: Use incremental search
	hlsearch = false,                         -- bool: Highlight all matches on previous searched patterns

	-- [[ Whitespace ]]
	expandtab = true,                         -- bool: Use spaces instead of tabs
	shiftwidth = 2,                           -- num:  Size of an indent
	softtabstop = 2,                          -- num:  Number of spaces tabs count for in insert mode
	tabstop = 2,                              -- num:  Number of spaces tabs count for
	showtabline = 2,                          -- always show tabs
	smartindent = true,                       -- make indenting smarter again

	-- [[ Splits ]]
	splitright = true,                        -- bool: Place new window to right of current one
	splitbelow = true,                        -- bool: Place new window below the current one

	-- [[ Command Mode ]]
	showmode = false,                         -- we don't need to see things like -- INSERT --

	-- [[ Syntax ]]
	smartcase = true,                         -- smart case
	wrap = false,                             -- display lines as one long line
	guifont = "monospace:h17",                -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.cmd allows vimscript to run within string
vim.cmd "set whichwrap+=<,>,[,],h,l"        -- move cursor to prev/next line when at beg/end
vim.cmd [[set iskeyword+=-]]                -- treat dashes as one word
