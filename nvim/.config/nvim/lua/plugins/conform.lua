return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "eslint", "prettier" },
			javascriptreact = { "eslint", "prettier" },
			typescript = { "eslint", "prettier" },
			typescriptreact = { "eslint", "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
      lua = { "stylua" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ async = true })
		end, { desc = "Format file or range" })
	end,
}
