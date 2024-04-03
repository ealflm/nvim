return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    opts = {
      window = {
        mappings = {
          ["<space>"] = "none",
          ["s"] = "none",
          ["<M-s>"] = "open_vsplit",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              ---@diagnostic disable-next-line: param-type-mismatch
              vim.fn.setreg("+", path, "c")
              print("yanked path: " .. path)
            end,
            desc = "copy path to clipboard",
          },
          ["<M-cr>"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()

              local terminal_util = require("utils.toggleterm_util")
              terminal_util.send_cmd_to_diffview_filehistory(":DiffviewFileHistory " .. path)
            end,
            desc = "open in diffview",
          },
          ["h"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()

              print("Opening: " .. path)
              vim.cmd("silent !explorer " .. path)
            end,
            desc = "open in explorer",
          },
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "D", -- this can only be used in the git_status source
            renamed = "R", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },
}
