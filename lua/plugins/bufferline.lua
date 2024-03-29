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
