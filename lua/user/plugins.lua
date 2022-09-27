local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  ----colorschemes
  --use "lunarvim/onedarker.nvim"
  --use { "catppuccin/nvim", as = "catppuccin" }
  --use "folke/tokyonight.nvim"
  --use "shaunsingh/moonlight.nvim"

  -- use "lewis6991/impatient.nvim" -- fast startup

  -- -- lsp config
  -- use "neovim/nvim-lspconfig"
  -- use "williamboman/nvim-lsp-installer"

  -- use "hrsh7th/nvim-pasta" -- Cycle yank history
  use "hrsh7th/nvim-cmp" -- Completion plugin
  use "hrsh7th/cmp-nvim-lsp" -- cmp lsp plugin
  use "hrsh7th/cmp-nvim-lua" -- cmp lua
  -- use "hrsh7th/cmp-buffer" -- buffer completions
  -- use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline opts
  use "hrsh7th/cmp-nvim-lsp-signature-help" -- cmdline opts
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use {
	-- "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- }
  -- use "numToStr/Comment.nvim" -- Comment
  -- use "JoosepAlviste/nvim-ts-context-commentstring" -- String ts comment
  -- use "lewis6991/gitsigns.nvim" -- gitsigns
  -- use "kyazdani42/nvim-web-devicons" -- tree webicons
  -- use "kyazdani42/nvim-tree.lua" -- nvim tree
  -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  -- use "moll/vim-bbye"
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- use "ahmedkhalf/project.nvim"
  -- use "nvim-lualine/lualine.nvim"
  -- use "simrat39/symbols-outline.nvim" -- tags
  -- use "lukas-reineke/indent-blankline.nvim" -- line indent
  -- use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  --   require("toggleterm").setup() end}
  -- use "nvim-treesitter/nvim-treesitter-refactor"

  -- use {
  --   "weilbith/nvim-code-action-menu",
  --   cmd = "CodeActionMenu",
  --   config = function()
  --     vim.g.code_action_menu_show_diff = false
  --   end,
  -- } -- better code action menu

  -- -- Cursorhold fix
  -- use {
  --   "antoinemadec/FixCursorHold.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.g.cursorhold_updatetime = 400
  --   end,
  -- }

  -- snippets
  use "L3MON4D3/LuaSnip" -- snip engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- -- run scripts asynchronously
  -- use "skywind3000/asyncrun.vim"
  -- -- notify popup plugin
  -- use "rcarriga/nvim-notify"
  -- -- Telescope
  -- use "nvim-telescope/telescope.nvim"
  -- use "nvim-telescope/telescope-media-files.nvim"
  -- -- Treesitter
  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   run = ":TSUpdate",
  -- }
  -- -- Mark lines plugin
  -- use "chentoast/marks.nvim"
  -- -- Colorizer, hex color etc.
  -- use "norcalli/nvim-colorizer.lua"
  -- -- smooth scrolling
  -- use "karb94/neoscroll.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
