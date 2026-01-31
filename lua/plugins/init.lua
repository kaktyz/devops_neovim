return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Move between windows tmux and vim
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    -- keys = {
    --   { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    --   { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    --   { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    --   { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    --   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    -- },
  },
  -- Prette renaming file 
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
-- Syntax highlight
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "go",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "tsx",
        "typescript",
        "terraform",
  		},
  	},
  },
-- Syntax highlight
  { "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  {
    "Pocco81/AutoSave.nvim",
    module = "autosave",
    lazy = false,
    config = function()
      require("configs.autosave").autosave()
    end,
   },

  {"hashivim/vim-terraform"},

  {
    "goolord/alpha-nvim",
    disable = false,
  },

  {
    "segeljakt/vim-silicon",
    config = function ()
      vim.cmd [[
        let g:silicon = {
          \   'theme':               'OneHalfDark',
          \   'font': 'Fira Code,Fira Code Medium',
          \   'background':              '#282c34',
          \   'shadow-color':            '#282c34',
          \   'line-pad':                        2,
          \   'pad-horiz':                       0,
          \   'pad-vert':                        0,
          \   'shadow-blur-radius':              0,
          \   'shadow-offset-x':                 0,
          \   'shadow-offset-y':                 0,
          \   'line-number':                v:true,
          \   'round-corner':               v:true,
          \   'window-controls':           v:false,
          \ }
          let g:silicon['output'] = '/tmp/silicon-{time:%Y-%m-%d-%H%M%S}.png'
         ]]
      end,
   },

  {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          -- lua stuff
          "lua-language-server",
          "stylua",
          -- web dev
          -- "css-lsp",
          -- "html-lsp",
          -- "typescript-language-server",
          "emmet-ls",
          "json-lsp",
          "prettier",
          "eslint-lsp",
          -- shell
          "bash-language-server",
          "shfmt",
          "shellcheck",
          -- python
          "pyright",
          "black",
          -- terraform
          "terraform-ls",
          -- ansible
          "ansible-language-server",
          -- docker
          "dockerfile-language-server",
          "flake8",
          -- rust
          "rust-analyzer",
          "rustfmt",
          "rustc",
        },
      },
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   lazy = false,
  -- },
  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     -- "neovim/nvim-lspconfig",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   lazy = false,
  --   opts = {
  --     -- configurations go here
  --     -- attach_navic = false,  -- Disables navic integration
  --   },
  -- },
  -- -- {
  --   "m4xshen/smartcolumn.nvim",
  --   opts = {},
  --   lazy = false,
  -- },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    -- @param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  -- Breadcrumps 
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = function()
      local dropbar_api = require('dropbar.api')
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end
  },
  {
    -- 'fgheng/winbar.nvim',
    'simrat39/symbols-outline.nvim',
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 45, -- желаемая ширина
      },
    },
  },
  -- Helm template
  -- towolf/vim-helm
  {
  "towolf/vim-helm",
  lazy = true,
  ft = {"helm", "yaml", "yml"}, -- загружать только для файлов Helm/YAML
  },
  {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional, но рекомендуется для иконок
  },
  lazy = false,
  opts = {
    -- Дополнительные настройки (опционально)
    theme = "auto", -- автоматическое определение темы
    show_dirname = true, -- показывать имя директории
    show_basename = true, -- показывать имя файла
  },
  config = function()
    require("barbecue").setup()
  end,
  },
  -- Git blame 
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,  -- включить blame для текущей строки
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',  -- или 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      })
    end,
    keys = {
        { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" }
    }
  },
  -- {
  -- "airblade/vim-gitgutter",
  -- lazy = false,
  -- }
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { import = "nvchad.blink.lazyspec" },
}

