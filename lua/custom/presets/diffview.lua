local a = vim.api
local o = vim.o

local init = function()
  vim.cmd "DiffviewOpen"
  vim.cmd "tabo"
  o.showtabline = 0
  o.laststatus = 0
end

a.nvim_create_user_command("InitDiffview", init, {})
