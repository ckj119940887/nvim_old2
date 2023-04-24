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

return require("packer").startup(function(use)
  -- package manager
  use("wbthomason/packer.nvim") 

  -- tokyonight colorscheme
  use("folke/tokyonight.nvim")

  -- nvim-tree 
  use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

  -- bufferline
  use({
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
  })

  -- lualine 
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use("arkav/lualine-lsp-progress")

  -- telescope 
  use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
  -- telescope extensions
  use("LinArcX/telescope-env.nvim")
  use("nvim-telescope/telescope-ui-select.nvim")

  -- dashboard-nvim
  use("glepnir/dashboard-nvim")

  -- project
  use("ahmedkhalf/project.nvim")

  -- treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("p00f/nvim-ts-rainbow")

  -- indent-blankline
  use("lukas-reineke/indent-blankline.nvim")

  --------------------- LSP --------------------
  -- use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
  use({ "williamboman/nvim-lsp-installer" })
  -- Lspconfig
  use({ "neovim/nvim-lspconfig" })
  -- 补全引擎
  use("hrsh7th/nvim-cmp")
  -- Snippet 引擎
  use("hrsh7th/vim-vsnip")
  -- 补全源
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
  -- 常见编程语言代码段
  use("rafamadriz/friendly-snippets")
  -- UI 增强
  use("onsails/lspkind-nvim")
  use("tami5/lspsaga.nvim")
  -- 代码格式化
  use("mhartington/formatter.nvim")
  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

  use({ "akinsho/toggleterm.nvim" })
  -- surround
  use("ur4ltz/surround.nvim")
  -- Comment
  use("numToStr/Comment.nvim")
  -- nvim-autopairs
  use("windwp/nvim-autopairs")
  -- git
  use({ "lewis6991/gitsigns.nvim" })
  -- vimspector
  use("puremourning/vimspector")

end)
