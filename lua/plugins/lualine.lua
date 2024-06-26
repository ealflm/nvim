if vim.g.clearmode == 1 then
  return {
    {
      "nvim-lualine/lualine.nvim",
      enabled = false,
    },
  }
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = {} },
      },
      sections = {
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
        },
      },
    },
  },
}
