local opt = vim.opt
local g = vim.g

g.neovide_input_macos_alt_is_meta = true
g.neovide_cursor_vfx_mode = "torpedo"

opt.mouse = ""
opt.wrap = false
opt.clipboard = ""
opt.autoread = true
opt.history = 999
opt.relativenumber = true
opt.swapfile = false
opt.guifont = { "JetBrainsMonoNL Nerd Font", ":h11" }
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

opt.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
opt.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
opt.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
opt.shellpipe = '2>&1 | %{ "$_" } | tee %s; exit $LastExitCode'
opt.shellquote = ""
opt.shellxquote = ""

-- Indenting
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

vim.cmd "set nofixendofline"

vim.api.nvim_set_keymap("", "<A-w>", "<C-w>", { noremap = true })

-- Avoid automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function()
    vim.cmd "setlocal formatoptions-=o"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "lua" },
  callback = function()
    opt.shiftwidth = 2
    opt.tabstop = 2
    opt.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*module.ts",
  callback = function()
    vim.cmd "e ++ff=dos"
  end,
})
