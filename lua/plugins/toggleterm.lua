local map = vim.keymap.set
local fn = vim.fn

local function lazygit_setup(term)
  local lazygit = term:new({ cmd = "lazygit", direction = "float" })

  map("n", "<M-;>", function()
    if lazygit:is_open() then
      fn.chansend(lazygit.job_id, "3")
    end
    lazygit:toggle()
  end, { noremap = true, silent = true })

  map("t", "<M-;>", function()
    lazygit:toggle()
  end, { noremap = true, silent = true })
end

local function float_terminal_setup(term)
  local lazygit = term:new({ direction = "float" })

  map("n", "<M-u>", function()
    if lazygit:is_open() then
      fn.chansend(lazygit.job_id, "3")
    end
    lazygit:toggle()
  end, { noremap = true, silent = true })

  map("t", "<M-u>", function()
    lazygit:toggle()
  end, { noremap = true, silent = true })
end

return {
  {
    event = "VeryLazy",
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()

      local term = require("toggleterm.terminal").Terminal

      lazygit_setup(term)
      float_terminal_setup(term)
    end,
  },
}
