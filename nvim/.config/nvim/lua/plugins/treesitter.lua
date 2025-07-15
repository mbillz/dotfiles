return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
          "typescript",
          "tsx",
          "javascript",
          "html",
          "css",
          "lua",
          "vim",
          "vimdoc",
          "query"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
  end
 }
