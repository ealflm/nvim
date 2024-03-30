local map = vim.keymap.set
local fn = vim.fn

local function lazygit_setup(terminal)
  local opts = { cmd = "lazygit", direction = "float" }

  local key = "<M-;>"

  local term = terminal:new(opts)

  local n_action = function()
    if term:is_open() then
      fn.chansend(term.job_id, "3")
    end
    print(term.job_id)
    term:toggle()
  end

  local t_action = function()
    term:toggle()
  end

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

local function float_terminal_setup(terminal)
  local opts = { direction = "float" }

  local key = "<M-u>"

  local term = terminal:new(opts)

  local n_action = function()
    term:toggle()
  end

  local t_action = function()
    term:toggle()
  end

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

local function horizontal_terminal_setup(terminal)
  local opts = { size = 200, direction = "horizontal" }

  local key = "<M-m>"

  local term = terminal:new(opts)

  local n_action = function()
    term:toggle()
  end

  local t_action = function()
    term:toggle()
  end

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

local function vertical_terminal_setup(terminal)
  local opts = { size = 200, direction = "vertical" }

  local key = "<M-'>"

  local term = terminal:new(opts)

  local n_action = function()
    term:toggle()
  end

  local t_action = function()
    term:toggle()
  end

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

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

      lazygit_setup(terminal)
      float_terminal_setup(terminal)
      horizontal_terminal_setup(terminal)
      vertical_terminal_setup(terminal)
    end,
  },
}
