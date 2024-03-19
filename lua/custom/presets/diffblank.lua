local a = vim.api
local o = vim.o

local init = function()
  vim.cmd("diffthis")
  vim.cmd("vnew")
  vim.cmd("diffthis")
  vim.cmd("wincmd h")
  o.showtabline = 0
end

a.nvim_create_user_command("InitDiffBlank", init, {})
