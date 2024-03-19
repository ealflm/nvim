local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "c_sharp",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "estint-lsp",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

M.nvimtree = {
  on_attach = require("custom.configs.nvim-tree").on_attach,
  filters = {
    dotfiles = true,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
    custom = { ".DS_Store", ".localized", ".workspace.md" },
  },
  diagnostics = {
    enable = false,
    show_on_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.ERROR,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = { hint = "", info = "", warning = "", error = "" },
  },
  git = { enable = true },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "name",
    icons = {
      show = { git = true },
      glyphs = {
        git = {
          unstaged = "◇",
          staged = "◆",
          unmerged = "",
          renamed = "﹡",
          untracked = "⟡",
          deleted = "⊝",
          ignored = "",
        },
      },
    },
  },
  actions = {
    use_system_clipboard = true,
    change_dir = { enable = true, global = true },
  },
  view = {
    adaptive_size = true,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  update_focused_file = { enable = false },
  filesystem_watchers = {
    enable = true,
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.82,
        border = "double",
      },
      lazygit = {
        shell = "lazygit",
        relative = "editor",
        row = 0,
        col = 0,
        width = 1,
        height = 1,
        border = "single",
      },
      diffview = {
        shell = "nvim --cmd 'let g:clearmode=1' -c 'InitDiffview'",
        relative = "editor",
        row = 0,
        col = 0,
        width = 1,
        height = 1,
        border = "single",
      },
      diffblank = {
        shell = "nvim --cmd 'let g:clearmode=2' -c 'InitDiffBlank'",
        relative = "editor",
        row = 0,
        col = 0,
        width = 1,
        height = 1,
        border = "single",
      },
      nvwork = {
        relative = "editor",
        row = 0,
        col = 0,
        width = 1,
        height = 1,
        border = "single",
      },
    },
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}

M.blankline = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = false,
  show_current_context_start = false,
}

local telescope_actions = require "telescope.actions"

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<C-x>"] = { "<esc>", type = "command" },
        ["<esc>"] = telescope_actions.close,
      },
    },
  },
  extensions = {
    -- repo = {
    --   list = {
    --     fd_opts = {"--no-ignore-vcs"},
    --     search_dirs = {"D:/"}
    --   }
    -- }
  },
  -- extensions_list = {"ui-select", "repo"}
  extensions_list = { "themes", "terms", "ui-select", "nvwork" },
}

local cmp = require "cmp"

M.cmp = {
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-o>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}

M.diffview = {
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = "diff3_mixed",
    },
  },
}

return M
