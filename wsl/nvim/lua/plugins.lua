require("lazy").setup({

  -- lsp
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  },

  -- autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

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

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- nvim-tree
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

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
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",  
    dependencies = { "nvim-lua/plenary.nvim" }
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
})

-- completion setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})

-- nvim-tree setup
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

-- treesitter setup
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "lua", "json", "bash", "markdown" },
  highlight = {
    enable = true,
  },
})

-- lualine setup
local gruvbox = require("lualine.themes.gruvbox")
gruvbox.normal.a = gruvbox.command.a
gruvbox.insert.a = gruvbox.command.a

require("lualine").setup({
  options = {
    theme = gruvbox,
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
