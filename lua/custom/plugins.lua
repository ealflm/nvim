local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "stevearc/conform.nvim",
        config = function()
          require "custom.configs.conform"
        end,
      },
      {
        "mfussenegger/nvim-lint",
        config = function()
          require "custom.configs.lint"
        end,
      },
      {
        "Hoffs/omnisharp-extended-lsp.nvim",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeFindFile" },
    opts = overrides.nvimtree,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "NvChad/nvterm",
    name = "nvterm_disabled",
    enabled = false,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  {
    "lewis6991/gitsigns.nvim",
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,

    cmd = "DiffviewOpen",
    keys = { "<leader>gh", "<leader>gc", "<leader>gq" },

    opts = overrides.diffview,
    init = function()
      require("core.utils").load_mappings "diffview"
    end,
    config = function(_, opts)
      require("diffview").setup(opts)
    end,
  },

  {
    "ealflm/nvterm",
    opts = overrides.nvterm,
    init = function()
      require("core.utils").load_mappings "nvterm"
    end,
    config = function(_, opts)
      require "base46.term"
      require("nvterm").setup(opts)
    end,
  },

  {
    "ealflm/nvwork",
    config = function()
      require("nvwork").setup()
    end,
  },

  {
    "ealflm/devenv",
    init = function()
      require("core.utils").load_mappings "devenv"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = "<F5>",
    config = function()
      require "custom.configs.nvim-dap"
      require("core.utils").load_mappings "dap"
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
          require "custom.configs.nvim-dap-ui"
          require("core.utils").load_mappings "dapui"
        end,
      },

      {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
          require "custom.configs.nvim-dap-virtual-text"
        end,
      },
      -- Install the vscode-js-debug adapter
      {
        "microsoft/vscode-js-debug",
        -- After install, build it and rename the dist directory to out
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && mv dist out",
        version = "1.*",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("dap-vscode-js").setup {
            -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- node_path = "node",

            -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.resolve(vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"),

            -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
            -- debugger_cmd = { "js-debug-adapter" },

            -- which adapters to register in nvim-dap
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
            },

            -- Path for file logging
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

            -- Logging level for output to file. Set to false to disable logging.
            -- log_file_level = false,

            -- Logging level for output to console. Set to false to disable console output.
            -- log_console_level = vim.log.levels.ERROR,
          }
        end,
      },
      {
        "Joakker/lua-json5",
        build = "./install.sh",
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

local disabled_plugins = {
  "neovim/nvim-lspconfig",
  "nvim-tree/nvim-tree.lua",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope.nvim",
}

if vim.g.clearmode ~= nil then
  if vim.g.clearmode == 2 then
    table.insert(disabled_plugins, "lewis6991/gitsigns.nvim")
    vim.api.nvim_set_hl(0, "DiffDelete", {})
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#273732" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#243e5d" })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#373844" })
  end

  for _, plugin in ipairs(plugins) do
    local plugin_name = plugin[1]
    if vim.tbl_contains(disabled_plugins, plugin_name) then
      plugin.enabled = false
    end
  end
end

return plugins
