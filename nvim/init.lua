-- Tab-related settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set nu")
vim.cmd("set relativenumber")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    {'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
    },
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { 'nvim-focus/focus.nvim', version = '*' },
    {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
  
      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick",         -- optional
    },
    config = true
  },

    {'akinsho/git-conflict.nvim', version = "*", config = true},

  -- Stop listing plugins here
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "github_light" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  }
})


-- telescope mappings; leader = space
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })

-- Set the colorscheme
vim.cmd('colorscheme github_light')

-- treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed={"lua", "javascript", "typescript", "python", "rust", "bash"},
  highlight = { enable = true },
  indent = { enable = true }
})

require('lualine').setup()

-- Working with pane split
require("focus").setup()

local focusmap = function(direction)
    vim.keymap.set('n', '<Leader>'..direction, function()
        require('focus').split_command(direction)
    end, { desc = string.format('Create or move to split (%s)', direction) })
end

-- Use `<Leader>h` to split the screen to the left, same as command FocusSplitLeft etc
focusmap('h')
focusmap('j')
focusmap('k')
focusmap('l')

-- ruff format
function ruff_format()
    -- Get the start and end of the visual selection
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    
    -- Create a range string for the external command
    local range = start_line .. "," .. end_line

    -- Execute my_script.sh on the selected range and replace the text
    vim.cmd(range .. "!ruff format - 2>/dev/null")
end

-- Create a key mapping for visual mode
vim.api.nvim_set_keymap('v', '<C-f>', ':lua ruff_format()<CR>', {noremap = true, silent = true})


-- neotree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
