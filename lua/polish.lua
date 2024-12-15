-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- NOTE: This detects whether the NeoVim instance is running in VSCode or not
local is_vscode = pcall(require, "vscode")

-- NOTE: This sets up the Everforest colorscheme and some Copilot keybindings
if not is_vscode then
  vim.g.everforest_background = "hard"

  -- vim.keymap.set("i", "<C-J>", function() require("avante").get_suggestion():accept() end, {
  --   expr = true,
  --   replace_keycodes = false,
  -- })
  vim.g.copilot_no_tab_map = true
else
  require("lazy").setup {
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup {
          -- Configuration here, or leave empty to use defaults
        }
      end,
    },
  }
end

-- NOTE: This is an attempt to force everything to use tabs instead of spaces
-- It mostly works, sometimes it doesn't
vim.opt.scrolloff = 12
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt_global.expandtab = false
vim.bo.tabstop = 4
vim.bo.expandtab = false
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.opt.colorcolumn = "100"
