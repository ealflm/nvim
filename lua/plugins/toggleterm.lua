local map = vim.keymap.set
local fn = vim.fn

local function lazygit_setup()
  local key = "<M-;>"

  local n_action = "<cmd>20ToggleTerm cmd=lazygit direction=float<cr>"
  local t_action = "<cmd>20ToggleTerm cmd=lazygit direction=float<cr>"

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

local function float_terminal_setup()
  local key = "<M-u>"

  local n_action = "<cmd>9ToggleTerm direction=float<cr>"
  local t_action = "<cmd>9ToggleTerm direction=float<cr>"

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

local function horizontal_terminal_setup()
  local key = "<M-m>"

  local n_action = "<cmd>7ToggleTerm direction=horizontal<cr>"
  local t_action = "<cmd>7ToggleTerm direction=horizontal<cr>"

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

local function vertical_terminal_setup()
  local key = "<M-'>"

  local n_action = "<cmd>10ToggleTerm direction=vertical<cr>"
  local t_action = "<cmd>10ToggleTerm direction=vertical<cr>"

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

      lazygit_setup()
      float_terminal_setup()
      horizontal_terminal_setup()
      vertical_terminal_setup()
    end,
  },
}
