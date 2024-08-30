return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          enabled = lsp == "phpactor",
        },
        intelephense = {
          enabled = lsp == "intelephense",
        },
        [lsp] = {
          enabled = true,
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "phpcs",
        "php-cs-fixer",
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.phpcsfixer)
      table.insert(opts.sources, nls.builtins.diagnostics.phpcs)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    config = function()
      require("flash").jump({
        pattern = ".", -- initialize pattern with any char
        search = {
          mode = function(pattern)
            -- remove leading dot
            if pattern:sub(1, 1) == "." then
              pattern = pattern:sub(2)
            end
            -- return word pattern and proper skip pattern
            return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
          end,
        },

        -- select the range
        jump = { pos = "range" },
      })
    end,
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<leader>y", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<leader>t", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
}
