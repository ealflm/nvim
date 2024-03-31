local map = vim.keymap.set

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "github/copilot.vim",
    },
    opts = {
      diagnostics = {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      },
    },
    init = function()
      map("n", "<A-cr>", function()
        vim.lsp.buf.code_action()
      end, { desc = "LSP code action" })
    end,
  },
}
