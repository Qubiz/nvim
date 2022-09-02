local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
	  'git', 
	  'clone', 
	  '--depth', 
	  '1', 
	  'https://github.com/wbthomason/packer.nvim', 
	  install_path,
  })
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
  -- Base
  use({"wbthomason/packer.nvim"})
  use({"nvim-lua/plenary.nvim"})
  use({"kyazdani42/nvim-tree.lua"})
  use({"kyazdani42/nvim-web-devicons"})
  use({"nvim-lualine/lualine.nvim"})
  use({"jose-elias-alvarez/null-ls.nvim"})
  
  -- Theme
  use({"sainnhe/sonokai"})
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
