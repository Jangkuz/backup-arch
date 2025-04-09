-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.opt.winbar = "%=%m %f"
LazyVim.safe_keymap_set("n", "<leader>nl", function()
	local name = vim.fn.input("Library name: ")
	if name ~= "" then
		vim.cmd("!dotnet new classlib -n " .. name .. " -o src/" .. name)
		vim.cmd("!dotnet sln add src/" .. name .. "/" .. name .. ".csproj")
		vim.cmd("OmniSharpReloadSolution")
	end
end, { desc = "Add new class library" })

LazyVim.safe_keymap_set("n", "<leader>yy", '"+y', { desc = "Copy to clipboard" })
LazyVim.safe_keymap_set("n", "<leader>pp", '"+p', { desc = "Paste from clipboard" })
