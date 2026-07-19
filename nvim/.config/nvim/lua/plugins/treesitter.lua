return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ensure_installed = {
			"typescript",
			"tsx",
			"javascript",
			"html",
			"css",
			"lua",
			"vim",
			"vimdoc",
			"query",
		}

		require("nvim-treesitter").install(ensure_installed)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"typescript",
				"typescriptreact",
				"javascript",
				"html",
				"css",
				"lua",
				"vim",
				"help",
				"query",
			},
			callback = function()
				vim.treesitter.start()
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
