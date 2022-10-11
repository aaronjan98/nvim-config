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
      return require("packer.util").float({ border = "none" })
    end,
    prompt_border = "rounded",
  },
}

require("lualine").setup {
  options = {
    theme = "palenight"
  }
}

-- Install your plugins here
return packer.startup({
  function(use)
    -- Plugin Mangager
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Lua Development
    use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "kyazdani42/nvim-web-devicons" -- tree webicons

    -- Lazy loading:
    -- Load on specific commands
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
      'w0rp/ale',
      ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
      cmd = 'ALEEnable',
      config = 'vim.cmd[[ALEEnable]]'
    }

    -- lazy load plugins in .local/share/nvim/site/pack/packer/opt
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview'}

    ----colorschemes
    use "folke/tokyonight.nvim"
    use "shaunsingh/moonlight.nvim"
    use 'Yagua/nebulous.nvim'

    -- use "lewis6991/impatient.nvim" -- fast startup

    -- LSP
    use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }) -- enable LSP
    use({ "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }) -- simple to use language server installer
    use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

    -- use "hrsh7th/nvim-pasta" -- Cycle yank history

    -- cmp plugins
    use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
    use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
    use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
    use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
    use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
    use "hrsh7th/cmp-cmdline" -- cmdline opts
    use "hrsh7th/cmp-nvim-lsp-signature-help" -- cmdline opts

    -- snippets
    use { "L3MON4D3/LuaSnip" } -- snip engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      commit = "518e27589c0463af15463c9d675c65e464efc2fe",
    })
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and treesitter
    use "tpope/vim-surround"
    use "numToStr/Comment.nvim" -- Comment

    -- use "lewis6991/gitsigns.nvim" -- gitsigns
    use "kyazdani42/nvim-tree.lua" -- nvim tree
    -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    -- use "moll/vim-bbye"
    -- use "ahmedkhalf/project.nvim"
    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("toggleterm").setup()
        -- require("lualine").theme() -- set inner bg transparent
      end
    }
    -- use "simrat39/symbols-outline.nvim" -- tags
    -- use "lukas-reineke/indent-blankline.nvim" -- line indent
    use {"akinsho/toggleterm.nvim", tag = 'v2.*'}

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

    -- -- run scripts asynchronously
    -- use "skywind3000/asyncrun.vim"
    -- -- notify popup plugin
    -- use "rcarriga/nvim-notify"

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })

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
  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'none' })
      end
    }},
})
