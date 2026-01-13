-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true })
vim.keymap.set('n', '<M-Tab>', '<cmd>bnext<CR>', { silent = true })
vim.keymap.set('n', '<M-S-Tab>', '<cmd>bprev<CR>', { silent = true })
vim.keymap.set('n', '<Leader>t', '<Cmd>vertical term<CR>')
vim.keymap.set('n', '<Leader>e', function()
  require("telescope.builtin").find_files({ no_ignore = true })
end)

vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter", }, {
  pattern = "term://*",
  command = "startinsert",
})

require("lazy").setup({
  spec = {
    {
      "lewis6991/gitsigns.nvim",
      opts = {},
    },

    {
      "lambdalisue/vim-suda",
    },

    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
    },

    {
      'EdenEast/nightfox.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'nightfox'
      end,
    },

    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        "ty",
        "ts_ls",
        "rust_analyzer",
        "gopls",
        "clangd",
        "lua_ls",
      },
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      },
    },

    {
      'akinsho/bufferline.nvim',
      version = '*',
      dependencies = {
        'nvim-tree/nvim-web-devicons'
      },
      config = function()
        require('bufferline').setup {
          options = {
            show_buffer_close_icons = false,
            show_close_icon = false,
            always_show_bufferline = false,
            auto_toggle_bufferline = true,
            indicator = {
              style = 'none',
            }
          }
        }
      end,
    },

    {
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      opts = {
        indent = {
          char = '▏',
        },
      },
    },

    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
    },

    {
      'stevearc/conform.nvim',
      opts = {
        formatters_by_ft = {
          python = { "ruff_format" },
          go = { "gofmt" },
          rust = { "rustfmt" },
        },
        format_on_save = {
          lsp_format = "fallback",
        }
      },
    },

    -- fix term bg color
    {
      'typicode/bg.nvim',
      lazy = false,
    },
  },

  -- colorscheme that will be used when installing plugins
  -- install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
