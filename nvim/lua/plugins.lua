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


packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'
    -- tokyonight
    -- use("folke/tokyonight.nvim")
    use 'marko-cerovac/material.nvim'
    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- lspconfig
    use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    use("rafamadriz/friendly-snippets")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- ui (新增)
    use("onsails/lspkind-nvim")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

    use("tami5/lspsaga.nvim" ) -- 新增

    -- 代码格式化
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

    -- JSON 增强
    use("b0o/schemastore.nvim")

    --ts
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

    -- 终端
    use "akinsho/toggleterm.nvim"


    -- 自动括号
    use "windwp/nvim-autopairs"

    -- 自动保存
    -- use { "Pocco81/AutoSave.nvim" }

    -- 注释
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- git
    use 'lewis6991/gitsigns.nvim'

    use "folke/which-key.nvim"

    use "ur4ltz/surround.nvim"


    -- session 
    use 'rmagatti/auto-session'


  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  },
})
