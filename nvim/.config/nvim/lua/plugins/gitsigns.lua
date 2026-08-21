return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame_opts = {
			delay = 200,
			virt_text_pos = "eol",
		},
	},
	config = function(_, opts)
		local gitsigns = require("gitsigns")
		gitsigns.setup(opts)

		-- blame
		vim.keymap.set("n", "<leader>gb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Blame Line" })
		vim.keymap.set("n", "<leader>gf", gitsigns.blame, { desc = "Blame File" })
		vim.keymap.set("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "Toggle Inline Blame" })

		-- hunks
		vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
		vim.keymap.set("n", "]h", function()
			gitsigns.nav_hunk("next")
		end, { desc = "Next Hunk" })
		vim.keymap.set("n", "[h", function()
			gitsigns.nav_hunk("prev")
		end, { desc = "Prev Hunk" })
	end,
}
