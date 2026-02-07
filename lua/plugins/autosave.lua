return{
  {
    "Pocco81/AutoSave.nvim",
    module = "autosave",
    lazy = false,
    config = function()
      require("configs.autosave").autosave()
    end,
   },
}
