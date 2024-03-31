return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = require("cmp").mapping.preset.insert({
        ["<Down>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Insert }),
        ["<Up>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Insert }),
        ["<C-o>"] = require("cmp").mapping.complete(),
        ["<C-e>"] = require("cmp").mapping.abort(),
        ["<CR>"] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = require("cmp").mapping.confirm({
          behavior = require("cmp").ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").confirm({
              behavior = require("cmp").ConfirmBehavior.Insert,
              select = true,
            })
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").confirm({
              behavior = require("cmp").ConfirmBehavior.Insert,
              select = true,
            })
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }),
    },
  },
}
