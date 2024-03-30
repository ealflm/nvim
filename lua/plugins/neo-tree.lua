return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["<space>"] = "none",
          ["s"] = "none",
          ["<M-s>"] = "open_vsplit",
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
            ignored = "!",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },
}
