return {
  "stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "biome", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettier", stop_after_first = true },
			typescript = { "biome", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettier", stop_after_first = true },
			json = { "biome", "prettier", stop_after_first = true },
			yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
		},
	},
	config = function(_, opts)
		opts.formatters = {
			biome = {
				command = require("conform.util").from_node_modules("biome"),
				args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
			},
		}
		require("conform").setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ async = true })
		end, { desc = "Format file or range" })
	end,
}
