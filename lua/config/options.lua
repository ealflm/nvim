-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

-- General
opt.autoread = true

-- Set default clipboard
opt.clipboard = ""

-- Set powershell
opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
opt.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
opt.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
opt.shellpipe = '2>&1 | %{ "$_" } | tee %s; exit $LastExitCode'
opt.shellquote = ""
opt.shellxquote = ""

-- Disable swapfile backup
opt.swapfile = false

-- Change diff symbol
opt.fillchars = opt.fillchars + "diff:░" -- alternatives = ⣿ ░ ─ .

-- Connect to vscode snippets
g.vscode_snippets_path = "C:/Users/ealflm/AppData/Roaming/Code/User/snippets"

-- Neovide
opt.guifont = { "JetBrainsMonoNL Nerd Font", ":h13" }
g.neovide_input_macos_alt_is_meta = true
g.neovide_cursor_vfx_mode = "torpedo"

-- Set fix end of line
opt.fixendofline = false
