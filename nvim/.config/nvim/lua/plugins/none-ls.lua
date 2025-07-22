return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local eslint_d = require("none-ls.diagnostics.eslint_d")

		null_ls.setup({
			sources = {
				eslint_d.with({
					diagnostics_format = "[eslint] #{m}\n(#{c})",
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc" })
					end,
				}),
			},
		})
	end,
}
