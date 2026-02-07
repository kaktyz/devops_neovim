return {
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

  { import = "nvchad.blink.lazyspec" },
}

