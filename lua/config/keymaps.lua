-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

map("x", "<C-c>", '"+y', { desc = "Copy to system" })

vim.keymap.set("n", "<A-\\>", function()
  vim.ui.input({ prompt = "Do you want to commit all (Y/N): " }, function(input)
    if input and ((input == "") or string.lower(input) == "y") then
      vim.cmd('!git add . && git commit -m "WIP"')
    else
      vim.cmd("echo ''")
    end
  end)
end, { desc = "Git fast commit" })

vim.keymap.set("n", "<C-\\>", function()
  vim.ui.input({ prompt = "Do you want to push all (Y/N): " }, function(input)
    if input and ((input == "") or string.lower(input) == "y") then
      vim.cmd('!git add . && git commit -m "WIP" && git push')
    else
      vim.cmd("echo ''")
    end
  end)
end, { desc = "Git fast push" })
