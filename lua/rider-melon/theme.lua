-- Core theme loading logic for Rider Melon

local palette = require("rider-melon.palette")
local highlights = require("rider-melon.highlights")
local terminal = require("rider-melon.terminal")

local M = {}

-- Main function called by the colorscheme command
function M.load()
	-- Clear highlights once at the beginning
	vim.cmd.hi("clear")
	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end

	-- Determine which palette to use
	local current_background = vim.o.background
	local colors
	if current_background == "dark" then
		colors = palette.dark
	else
		-- Default to light if not 'dark'
		colors = palette.light
		-- Ensure background option matches the chosen mode
		if current_background ~= "light" then
			vim.o.background = "light" -- Set it for consistency
		end
	end

	-- Load highlights and terminal colors using the chosen palette
	highlights.load(colors)
	terminal.load(colors)

	vim.g.colors_name = "rider-melon"
end

-- --- Automatic Reloading on Background Change ---
-- Use a protected call to avoid errors if group already exists
pcall(vim.api.nvim_create_augroup, "RiderMelonReload", { clear = true })

vim.api.nvim_create_autocmd("OptionSet", {
	group = "RiderMelonReload",
	pattern = "background",
	callback = function()
		-- Use pcall to avoid errors if module somehow isn't loaded
		pcall(require("rider-melon.theme").load)
	end,
})

return M
