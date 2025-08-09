require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
	float = {
		border = "rounded",
		focusable = false,
		max_width = 80,
		source = "always",
    wrap = true,
	},
})

vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })
