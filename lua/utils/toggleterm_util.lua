local M = {}
local map = vim.keymap.set
local fn = vim.fn

local is_file_or_path = function(input)
  local stat = vim.loop.fs_stat(input)
  if stat then
    if stat.type == "directory" then
      return "path"
    elseif stat.type == "file" then
      return "file"
    end
  else
    return "not found"
  end
end

M.toggle_all_term = function()
  vim.cmd("ToggleTermToggleAll")
end

M.lazygit_setup = function(terminal)
  local opts = { cmd = "powershell -Command lazygit", direction = "float" }

  local key = "<M-;>"

  local term = terminal:new(opts)

  local n_action = function()
    term:toggle()
    fn.chansend(term.job_id, ";")
  end

  local t_action = function()
    term:toggle()
  end

  local open_file_action = function()
    if term:is_open() then
      fn.chansend(term.job_id, "Y")
      local cliptext = fn.getreg("*")

      local type = is_file_or_path(cliptext)

      if type == "file" then
        term:toggle()
        vim.cmd(":e " .. cliptext)
      end
    end
  end

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
  map("t", "<M-cr>", open_file_action, { noremap = true, silent = true })
end

M.diffview_setup = function(terminal)
  local opts = { cmd = "nvim --cmd 'let g:clearmode=1' -c 'DiffviewOpen'", direction = "float" }

  local key = "<M-e>"

  local term = terminal:new(opts)

  local n_action = function()
    term:toggle()
    fn.chansend(term.job_id, "R")
  end

  local t_action = function()
    term:toggle()
  end

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

local diffview_filehistory_term = nil

M.diffview_filehistory_setup = function(terminal)
  local opts = { cmd = "nvim --cmd 'let g:clearmode=1' -c 'DiffviewFileHistory'", direction = "float" }

  local key = "<M-S-e>"

  diffview_filehistory_term = terminal:new(opts)

  local n_action = function()
    diffview_filehistory_term:toggle()
    fn.chansend(diffview_filehistory_term.job_id, "R")
  end

  local t_action = function()
    diffview_filehistory_term:toggle()
  end

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

M.send_cmd_to_diffview_filehistory = function(cmd)
  if diffview_filehistory_term ~= nil then
    diffview_filehistory_term:toggle()
    fn.chansend(diffview_filehistory_term.job_id, "R")
    fn.chansend(diffview_filehistory_term.job_id, { cmd, "" })
  end
end

M.float_terminal_setup = function()
  local key = "<M-u>"

  local n_action = "<cmd>9ToggleTerm direction=float<cr>"
  local t_action = "<cmd>9ToggleTerm direction=float<cr>"

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

M.horizontal_terminal_setup = function()
  local key = "<M-m>"

  local n_action = "<cmd>7ToggleTerm direction=horizontal<cr>"
  local t_action = "<cmd>7ToggleTerm direction=horizontal<cr>"

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

M.vertical_terminal_setup = function()
  local key = "<M-'>"

  local n_action = "<cmd>10ToggleTerm direction=vertical<cr>"
  local t_action = "<cmd>10ToggleTerm direction=vertical<cr>"

  map("n", key, n_action, { noremap = true, silent = true })
  map("t", key, t_action, { noremap = true, silent = true })
end

return M
