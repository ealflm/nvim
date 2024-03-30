if vim.g.clearmode ~= 1 then
  return {}
end

local map = vim.keymap.set

return {
  {
    "sindrets/diffview.nvim",
    lazy = false,
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },

    config = function(_, opts)
      require("diffview").setup(opts)
    end,

    init = function()
      vim.cmd("tabo")
      vim.o.showtabline = 0
      vim.o.laststatus = 0
    end,
  },
}
