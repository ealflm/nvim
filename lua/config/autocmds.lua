-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Avoid auto comment when enter
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function()
    vim.cmd("setlocal formatoptions-=o")
  end,
})

-- fix NestJs module filetype
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*module.ts",
  callback = function()
    vim.cmd("e ++ff=dos")
  end,
})
