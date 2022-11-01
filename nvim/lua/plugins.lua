-- run :PackerSync after modifying plugins

-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- without this, packer will try to delete itself on sync

	-- if this file gets too busy, you can pull plugins out into individual files that return
	-- the table being passed to the use function, eg:
	--
	-- lua/plugins/telescope.lua:
	-- return {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	requires = "nvim-lua/plenary.nvim",
	--
	-- 	config = function()
	-- 		-- pass config overrides to the setup function here
	-- 		require("telescope").setup({})
	-- 	end,
	-- }
	--
	-- lua/plugins.lua:
	-- use(require("plugins.telescope"))

	-- your plugins go here

	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",

		config = function()
			-- pass config overrides to the setup function here
			require("telescope").setup({})
		end,
	})

	use({
		"folke/tokyonight.nvim",

		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	})

	-- /your plugins go here

	if packer_bootstrap then
		require("packer").sync()
	end
end)
