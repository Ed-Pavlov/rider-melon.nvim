-- Main entry point for the rider-melon plugin

local config = require("rider-melon.config")
local theme = require("rider-melon.theme")

local M = {}

-- The setup function that users will call
function M.setup(user_config)
	config.setup(user_config)
	-- Initial load of the theme can happen here or be left to `colorscheme` command
	-- theme.load()
end

-- Make the load function accessible if needed directly
M.load = theme.load

return M
