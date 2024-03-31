-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- REMOVE
local remove = vim.keymap.del

-- floating terminal
remove("n", "<leader>ft", { desc = "Terminal (Root Dir)" })
remove("n", "<leader>fT", { desc = "Terminal (cwd)" })
remove("n", "<c-/>", { desc = "Terminal (Root Dir)" })
remove("n", "<c-_>", { desc = "which_key_ignore" })
remove("n", "<leader>gg", { desc = "Lazygit (Root Dir)" })
remove("n", "<leader>gG", { desc = "Lazygit (cwd)" })
remove("n", "<leader>gf", { desc = "Lazygit Current File History" })
remove("t", "<esc><esc>", { desc = "Enter Normal Mode" })

-- MAP
local map = vim.keymap.set

-- general
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

map("x", "<C-c>", '"+y', { desc = "Copy to system" })

map("n", "<A-v>", "<C-v>", { noremap = true })

-- git
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

-- comment
map("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

map(
  "v",
  "<C-_>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment visual" }
)

-- neotree
map("n", "<tab>", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
end, { desc = "Toggle neo-tree" })

map("n", "<c-tab>", function()
  require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
end, { desc = "Toggle neo-tree" })
