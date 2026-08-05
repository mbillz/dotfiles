return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		settings = {
			-- exposes "add missing imports", "organize imports", "remove unused", "fix all"
			expose_as_code_action = "all",
			complete_function_calls = true,
			jsx_close_tag = { enable = true },
		},
	},
}
