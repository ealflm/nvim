local map = vim.keymap.set

local function init_env()
  vim.cmd("DiffviewOpen")
  vim.cmd("tabo")
  vim.o.showtabline = 0
  vim.o.laststatus = 0
end

return {
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "InitDiffview" },
    keys = { "<leader>gh", "<leader>gc", "<leader>gq" },

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
      if vim.g.clearmode == 1 then
        init_env()
      end
    end,
  },
}
