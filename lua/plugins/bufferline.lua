if vim.g.clearmode == 1 then
  return {
    {
      "akinsho/bufferline.nvim",
      enabled = false,
    },
  }
end

return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<C-q>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<C-e>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
      highlights = {
        fill = {
          fg = "#16161e",
          bg = "#16161e",
        },
      },
    },
  },
}
