local cmp = require "cmp"

local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    lazy = false,
    config = function()
      require("custom.configs.pretty-fold").config()
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("custom.configs.lastplace").config()
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require "custom.configs.mason"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = "neovim/nvim-lspconfig",
  --   config = function()
  --     require "custom.configs.rust-tools"
  --   end,
  -- },

  -- rust
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      require("custom.configs.rust-tools").config()
    end,
    dependencies = { "neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim" },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "go", "lua", "json", "sh" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
      require("core.utils").load_mappings "crates"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }

      M.mapping["<C-j>"] = cmp.mapping(function(_fallback)
        cmp.mapping.abort()
        require("copilot.suggestion").accept_line()
      end, {
        "i",
        "s",
      })

      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  -- {
  --   "rmagatti/auto-session",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.auto-session"
  --   end,
  -- },
  -- nvim-treesitter
  {
    "p00f/nvim-ts-rainbow",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = function()
      return require "custom.configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- indent
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   init = function()
  --     require("core.utils").lazy_load "indent-blankline.nvim"
  --   end,
  --   opts = function()
  --     return require "custom.configs.blankline_bg"
  --   end,
  --   config = function(_, opts)
  --     require("core.utils").load_mappings "blankline"
  --     dofile(vim.g.base46_cache .. "blankline")
  --     require("indent_blankline").setup(opts)
  --   end,
  -- },

  --  notify
  -- {
  --   "rcarriga/nvim-notify",
  --   lazy = false,
  --   config = function()
  --     require("custom.configs.notify").config()
  --   end,
  -- },
  -- {
  --   "VonHeikemen/fine-cmdline.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   lazy = false,
  --   keys = {
  --     { ":", "<cmd>FineCmdline<CR>", desc = "Commandline Floating" },
  --   },
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.noice"
    end,
    -- add any options here
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
}
return plugins
