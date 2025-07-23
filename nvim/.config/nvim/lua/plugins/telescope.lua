return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fx", function()
			builtin.diagnostics({ bufnr = 0 })
		end, { desc = "Diagnostics (current file)" })
		vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { desc = "LSP References" })
		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").lsp_definitions, { desc = "LSP Definitions" })
		vim.keymap.set(
			"n",
			"<leader>fi",
			require("telescope.builtin").lsp_implementations,
			{ desc = "LSP Implementations" }
		)
		vim.keymap.set(
			"n",
			"<leader>ft",
			require("telescope.builtin").lsp_type_definitions,
			{ desc = "LSP Type Definitions" }
		)

		-- git
		vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
		vim.keymap.set("n", "<leader>gS", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
		vim.keymap.set("n", "<leader>gB", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
	end,
}
