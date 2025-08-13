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
      -- gruvbox_theme.normal.a = gruvbox_theme.command.a
      -- gruvbox_theme.insert.a = gruvbox_theme.command.a

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
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_opened_files = "name",
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
      })
    end,
  },

})
