-- Helm template  
return{
  {
  "towolf/vim-helm",
  lazy = true,
  ft = {"helm", "yaml", "yml"}, -- загружать только для файлов Helm/YAML
  },
}
