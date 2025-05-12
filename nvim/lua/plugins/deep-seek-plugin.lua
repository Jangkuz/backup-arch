return {
  -- add gruvbox
  {
    "Hoffs/omnisharp-extended-lsp.nvim", -- Better C# LSP integration
    "mfussenegger/nvim-dap", -- Debugging
    "theprimeagen/harpoon", -- Quick file navigation
    -- "adelarsq/neofsharp.vim", -- F# syntax (for Blazor interop)
  },
  {
    "danielfalk/smart-open.nvim",
    dependencies = { "kkharji/sqlite.lua" },
  },
}
