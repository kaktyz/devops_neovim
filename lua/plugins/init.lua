return {
-- Syntax highlight
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "go",
        "bash",
        "lua",
        "markdown",
        "python",
        "regex",
        "rust",
        "yaml",
        "terraform",
  		},
  	},
  },
  {"hashivim/vim-terraform"},
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
          "json-lsp",
          -- shell
          "bash-language-server",
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
          -- rust
          "rust-analyzer",
          "rustfmt",
          "rustc",
        },
      },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   -- @param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "emoji" })
  --   end,
  -- },

  -- {
  --   -- 'fgheng/winbar.nvim',
  --   'simrat39/symbols-outline.nvim',
  -- },

  -- {
  -- "utilyre/barbecue.nvim",
  -- name = "barbecue",
  -- version = "*",
  -- dependencies = {
  --   "SmiteshP/nvim-navic",
  --   "nvim-tree/nvim-web-devicons", -- optional, но рекомендуется для иконок
  -- },
  -- lazy = false,
  -- opts = {
  --   -- Дополнительные настройки (опционально)
  --   theme = "auto", -- автоматическое определение темы
  --   show_dirname = true, -- показывать имя директории
  --   show_basename = true, -- показывать имя файла
  -- },
  -- config = function()
  --   require("barbecue").setup()
  -- end,
  -- },
  -- Git blame 
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   lazy = false,
  --   config = function()
  --     require('gitsigns').setup({
  --       current_line_blame = true,  -- включить blame для текущей строки
  --       current_line_blame_opts = {
  --         virt_text = true,
  --         virt_text_pos = 'eol',  -- или 'right_align'
  --         delay = 1000,
  --         ignore_whitespace = false,
  --       },
  --       current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  --     })
  --   end,
  --   keys = {
  --       { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" }
  --   }
  -- },
  -- {
  -- "airblade/vim-gitgutter",
  -- lazy = false,
  -- }
  -- {
  --   "folke/todo-comments.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --   }
  -- },
  -- { import = "nvchad.blink.lazyspec" },
}

