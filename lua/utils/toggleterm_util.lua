local M = {}
local map = vim.keymap.set
local remove_map = vim.keymap.del
local fn = vim.fn

local job_ids = {}

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

local function contains_value(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

M.toggle_all_term = function()
  vim.cmd("ToggleTermToggleAll")
end

M.lazygit_setup = function(terminal)
  local opts = {
    cmd = "lazygit",
    direction = "float",
    on_open = function(term)
      if not contains_value(job_ids, term.job_id) then
        table.insert(job_ids, term.job_id)
      end
    end,
  }

  local key = "<M-;>"

  local term = terminal:new(opts)

  local n_action = function()
    term:toggle()
    fn.chansend(term.job_id, ";")

    -- Avoid screen lag bug
    vim.cmd("norm 0")
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
  local opts = {
    cmd = "nvim --cmd 'let g:clearmode=1' -c 'DiffviewOpen'",
    direction = "float",

    on_open = function(term)
      if not contains_value(job_ids, term.job_id) then
        table.insert(job_ids, term.job_id)
      end
      remove_map("t", "<C-h>", { desc = "Go to Left Window", remap = true })
      remove_map("t", "<C-j>", { desc = "Go to Lower Window", remap = true })
      remove_map("t", "<C-k>", { desc = "Go to Upper Window", remap = true })
      remove_map("t", "<C-l>", { desc = "Go to Right Window", remap = true })
    end,
    on_close = function(_)
      map("t", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
      map("t", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
      map("t", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
      map("t", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
    end,
  }

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
  local opts = {
    cmd = "nvim --cmd 'let g:clearmode=1' -c 'DiffviewFileHistory'",
    direction = "float",

    on_open = function(term)
      if not contains_value(job_ids, term.job_id) then
        table.insert(job_ids, term.job_id)
      end

      remove_map("t", "<C-h>", { desc = "Go to Left Window", remap = true })
      remove_map("t", "<C-j>", { desc = "Go to Lower Window", remap = true })
      remove_map("t", "<C-k>", { desc = "Go to Upper Window", remap = true })
      remove_map("t", "<C-l>", { desc = "Go to Right Window", remap = true })
    end,
    on_close = function(_)
      map("t", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
      map("t", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
      map("t", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
      map("t", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
    end,
  }

  local key = "<M-S-e>"

  diffview_filehistory_term = terminal:new(opts)

  local n_action = function()
    diffview_filehistory_term:toggle()
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

M.float_terminal_setup = function(terminal)
  local opts = {
    direction = "float",

    on_open = function(term)
      if not contains_value(job_ids, term.job_id) then
        table.insert(job_ids, term.job_id)
      end

      remove_map("t", "<C-h>", { desc = "Go to Left Window", remap = true })
      remove_map("t", "<C-j>", { desc = "Go to Lower Window", remap = true })
      remove_map("t", "<C-k>", { desc = "Go to Upper Window", remap = true })
      remove_map("t", "<C-l>", { desc = "Go to Right Window", remap = true })
    end,
    on_close = function(_)
      map("t", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
      map("t", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
      map("t", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
      map("t", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
    end,
  }

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

M.horizontal_terminal_setup = function(terminal)
  local opts = {
    direction = "horizontal",

    on_open = function(term)
      if not contains_value(job_ids, term.job_id) then
        table.insert(job_ids, term.job_id)
      end
    end,
  }

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

M.vertical_terminal_setup = function(terminal)
  local opts = {
    direction = "vertical",

    on_open = function(term)
      if not contains_value(job_ids, term.job_id) then
        table.insert(job_ids, term.job_id)
      end
    end,
  }

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

M.kill_all_job = function()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      print("Close buffer: " .. buf)
      vim.cmd(buf .. "bd!")
    end
  end
end

return M
