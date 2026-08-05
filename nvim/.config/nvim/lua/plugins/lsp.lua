return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		})

		vim.lsp.enable({
			"lua_ls",
			"cssls",
			"jsonls",
			"html",
			"tailwindcss",
		})

		-- nvim 0.11+ already maps grn (rename), gra (code action), grr (references),
		-- gri (implementation), grt (type definition), gO (symbols), K (hover).
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto definition" }))
				vim.keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Goto declaration" })
				)
			end,
		})
	end,
}
