require("lazy").setup({

  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "hard",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons", "MaximilianLloyd/ascii.nvim" },
    config = function()
      local ascii = require("ascii.text.neovim")
      local msharp_art = ascii.sharp   

      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = msharp_art,      -- ASCII header here
          shortcut = {              -- shortcuts table
            { desc = "󰈞  Find File", group = "Label", key = "f", action = "Telescope find_files" },
            { desc = "  Projects", group = "Label", key = "p", action = "Telescope projects" },
            { desc = "  Quit", group = "Label", key = "q", action = "qa" },
            { desc = "  Dotfiles", group = "Number", action = "Telescope dotfiles", key = "d" },
          },
          packages = {
            enable = true,
          },
          project = {
            enable = true,
            limit = 8,
            icon = " ",
            label = " Recent Projects",
            action = "Telescope find_files cwd=",
          },
          mru = {
            enable = true,
            limit = 10,
            icon = " ",
            label = " Recent Files",
            cwd_only = false,
          },
          footer = {
            "⚡ Neovim loaded. Have a productive day!",
          },
        },
      })
    end,
  },

  {
  "williamboman/mason.nvim",
  config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      },
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    }
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- comment
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local gruvbox_theme = require("lualine.themes.gruvbox")
      require("lualine").setup({
        options = {
          theme = gruvbox_theme,
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = {
            {
              function()
                return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              end,
            },
          },
        },
      })
    end,
  },

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        open_on_tab = true,
        view = { width = 30, side = "left" },
        renderer = { highlight_opened_files = "name" },
        actions = { open_file = { window_picker = { enable = false } } },
      })
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile"}
  },

  {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  },
})
