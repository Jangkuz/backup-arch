local function rename_file_and_class()
  local old_name = vim.fn.expand("%:t:r")
  local new_name = vim.fn.input("New name (without .cs): ", old_name)
  if new_name ~= "" and new_name ~= old_name then
    -- Rename file
    local old_path = vim.fn.expand("%:p")
    local new_path = vim.fn.expand("%:p:h") .. "/" .. new_name .. ".cs"
    vim.cmd("saveas " .. new_path)
    vim.cmd("silent !rm " .. old_path)
    -- Rename symbol via LSP
    vim.lsp.buf.rename(new_name)
  end
end

vim.keymap.set("n", "<leader>cr", rename_file_and_class, { desc = "Rename file+class" })
