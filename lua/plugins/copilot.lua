return {
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      vim.cmd("Copilot setup")

      vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)")
      vim.keymap.set("i", "<C-h>", "<Plug>(copilot-accept-line)")
    end,
  },
}
