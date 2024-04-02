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
      { "<M-1>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Goto Buffer 1" },
      { "<M-2>", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Goto Buffer 2" },
      { "<M-3>", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Goto Buffer 3" },
      { "<M-4>", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Goto Buffer 4" },
      { "<M-5>", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Goto Buffer 5" },
      { "<M-6>", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Goto Buffer 6" },
      { "<M-7>", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Goto Buffer 7" },
      { "<M-8>", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Goto Buffer 8" },
      { "<M-9>", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Goto Buffer 9" },
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
