return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      xml = { "csharpier" }, -- For .csproj files
    },
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = false,
    -- },
    formatters = {
      csharpier = {
        command = "csharpier",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
