require("lazy").setup({

  -- Mason LSP
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

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
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

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },

  -- Gruvbox
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
          folds = true,
        },
        inverse = true,
        contrast = "hard",
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "lua", "json", "bash", "markdown" },
        highlight = { enable = true },
      })
    end,
  },

  -- Nvim-tree
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
            window_picker = { enable = false },
          },
        },
      })
    end,
  },

  { "nvim-tree/nvim-web-devicons" },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local theme = require("lualine.themes.gruvbox")

      require("lualine").setup({
        options = {
          theme = theme,
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
            function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            end,
          },
        },
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "MaximilianLloyd/ascii.nvim",
    },
    config = function()
      local ascii = require("ascii.text.neovim")

      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = ascii.sharp,
          shortcut = {
            { key = "f", desc = "󰈞  Find File", action = "Telescope find_files" },
            { key = "p", desc = "  Projects", action = "Telescope projects" },
            { key = "d", desc = "  Dotfiles", action = "Telescope dotfiles" },
            { key = "q", desc = "  Quit", action = "qa" },
          },
          project = { enable = true, limit = 8 },
          mru = { enable = true, limit = 10 },
          footer = { "⚡ Neovim loaded." },
        },
      })
    end,
  },
})
