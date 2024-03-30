if vim.g.clearmode == 1 then
  return {}
end

local map = vim.keymap.set

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
      local util = require("utils.toggleterm_util")

      util.diffview_setup(terminal)
      util.diffview_filehistory_setup(terminal)
      util.float_terminal_setup()
      util.horizontal_terminal_setup()
      util.vertical_terminal_setup()

      map("t", "<A-q>", util.toggle_all_term, { noremap = true, silent = true })
    end,
  },
}
