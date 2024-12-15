-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.csharpier,
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports,
      require("none-ls.diagnostics.eslint_d").with {
        cmd = { "npx", "eslint_d" },
        run_on_save = true,
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        format = false,
      },
    }
    config.debug = true
    return config -- return final config table
  end,
}
