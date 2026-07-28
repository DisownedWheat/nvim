local function gh(repo) return 'https://github.com/' .. repo end

-- Colourscheme
vim.pack.add { gh 'rose-pine/neovim' }
vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('rose-pine').setup {
  dim_inactive_windows = true,
  styles = {
    transparent_background = true,
  },
}
require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  -- dim_inactive = {
  --   enabled = true,
  --   shade = nil,
  --   percentage = 0.001,
  -- },
  -- float = {
  --   -- transparent = true,
  --   solid = true,
  -- },
  integrations = {
    mini = {
      enabled = true,
    },
    telescope = { enabled = true },
  },
}

-- Mini NVIM libs
-- Git
require('mini.git').setup()

local move = require 'mini.move'
move.setup()

local mini_icons = require 'mini.icons'
mini_icons.setup()

local mini_files = require 'mini.files'
mini_files.setup()

local align = require 'mini.align'
align.setup()

require('mini.pick').setup()

-- local map = require 'mini.map'
-- map.setup {
--   integrations = {
--     map.gen_integration.builtin_search(),
--     map.gen_integration.diff(),
--     map.gen_integration.diagnostic(),
--   },
-- }

vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Minifiles' })
vim.keymap.set('n', '\\', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Minifiles' })
vim.keymap.set('n', '|', '<cmd>Neotree toggle<CR>')
-- vim.keymap.set('n', '|', '<cmd>lua MiniMap.toggle()<CR>')

vim.cmd.colorscheme 'catppuccin'
-- vim.cmd.colorscheme 'rose-pine-moon'

-- Globals
vim.opt_global.tabstop = 4
vim.opt_global.shiftwidth = 4
vim.opt_global.exrc = true
vim.opt_global.expandtab = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.exrc = true
vim.opt.expandtab = false
vim.opt.wrap = false

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = false
    vim.opt.wrap = false
  end,
})
