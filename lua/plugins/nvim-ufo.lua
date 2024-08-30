return {
  "kevinhwang91/nvim-ufo",
  requires = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    -- Setup nvim-ufo
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    })

    -- Set up keymaps for fold navigation
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  end,
}
