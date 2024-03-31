return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
    init = function()
      vim.keymap.set("x", "<M-s>", "<Plug>(nvim-surround-visual)")
    end,
  },
}
