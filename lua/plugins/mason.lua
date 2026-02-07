return{
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
}
