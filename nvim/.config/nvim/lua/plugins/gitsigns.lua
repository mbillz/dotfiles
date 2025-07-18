return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				local cmd = vim.api.nvim_buf_create_user_command
				cmd(bufnr, "GPreview", gs.preview_hunk, {})
				cmd(bufnr, "GStage", gs.stage_hunk, {})
				cmd(bufnr, "GReset", gs.reset_hunk, {})
				cmd(bufnr, "GBlame", function()
					gs.blame_line({ full = true })
				end, {})
				cmd(bufnr, "GNextHunk", gs.next_hunk, {})
				cmd(bufnr, "GPrevHunk", gs.prev_hunk, {})

				-- Keymaps
				map("n", "]h", gs.next_hunk, "Next Git hunk")
				map("n", "[h", gs.prev_hunk, "Prev Git hunk")
				map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
			end,
		})
	end,
}
