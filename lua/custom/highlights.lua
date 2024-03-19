-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  DiffDelete = { bg = "#362b31" },
  DiffviewDiffAdd = { bg = "#273732" },
  DiffviewDiffText = { bg = "#243e5d" },
  -- DiffviewDiffChange = { bg = "#373844" },
}

return M
