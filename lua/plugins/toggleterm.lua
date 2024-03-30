return {
  {
    event = "VeryLazy",
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return vim.o.lines * 0.4
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
      })

      local terminal = require("toggleterm.terminal").Terminal
      local terminal_util = require("utils.toggleterm_util")

      terminal_util.lazygit_setup(terminal)
      terminal_util.diffview_setup(terminal)
      terminal_util.diffview_filehistory_setup(terminal)
      terminal_util.float_terminal_setup()
      terminal_util.horizontal_terminal_setup()
      terminal_util.vertical_terminal_setup()
    end,
  },
}
