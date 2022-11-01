vim.g.mapleader = " " -- use space for leader

local mappings = {
	-- you can include an optional fourth argument to these tables that contains flags for the mapping, eg:
	-- `{ noremap = true, silent = true }`

	-- telescope
	{ "n", "<leader>t", ":Telescope find_files<CR>" },
	{ "n", "<leader>a", ":Telescope live_grep<CR>" },
	{ "n", "<leader>km", ":Telescope keymaps<CR>" },
	{ "n", "<leader>be", ":Telescope buffers<CR>" },
	{ "n", "<leader>gs", ":Telescope git_status<CR>" },
	{ "n", "<leader>gc", ":Telescope git_commits<CR>" },
	{ "n", "<leader>gb", ":Telescope git_branches<CR>" },
}

for _, m in ipairs(mappings) do
	vim.api.nvim_set_keymap(m[1], m[2], m[3], m[4] or {})
end
