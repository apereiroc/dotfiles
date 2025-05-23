return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       --- @usage 'auto'|'main'|'moon'|'dawn'
  --       variant = "moon",
  --       --- @usage 'main'|'moon'|'dawn'
  --       dark_variant = "moon",
  --       bold_vert_split = false,
  --       dim_nc_background = false,
  --       disable_background = false,
  --       disable_float_background = false,
  --       disable_italics = false,
  --
  --       --- @usage string hex value or named color from rosepinetheme.com/palette
  --       groups = {
  --         background = "base",
  --         background_nc = "_experimental_nc",
  --         panel = "surface",
  --         panel_nc = "base",
  --         border = "highlight_med",
  --         comment = "muted",
  --         link = "iris",
  --         punctuation = "subtle",
  --
  --         error = "love",
  --         hint = "iris",
  --         info = "foam",
  --         warn = "gold",
  --
  --         headings = {
  --           h1 = "iris",
  --           h2 = "foam",
  --           h3 = "rose",
  --           h4 = "gold",
  --           h5 = "pine",
  --           h6 = "foam",
  --         },
  --         -- or set all headings at once
  --         -- headings = 'subtle'
  --       },
  --
  --       -- Change specific vim highlight groups
  --       -- https://github.com/rose-pine/neovim/wiki/Recipes
  --       highlight_groups = {
  --         ColorColumn = { bg = "rose" },
  --
  --         -- Blend colours against the "base" background
  --         CursorLine = { bg = "foam", blend = 10 },
  --         StatusLine = { fg = "love", bg = "love", blend = 10 },
  --
  --         -- By default each group adds to the existing config.
  --         -- If you only want to set what is written in this config exactly,
  --         -- you can set the inherit option:
  --         Search = { bg = "gold", inherit = false },
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").load()
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })
    end,
  },
}
