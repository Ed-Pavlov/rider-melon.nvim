-- Handles configuration for the rider-melon theme

local M = {}

-- Default configuration options
M.options = {
	-- Add configuration options here later, e.g.:
	-- transparent_background = false,
	-- italic_comments = true,
	-- overrides = {}, -- Allow user overrides for highlight groups
}

-- Setup function to merge user config with defaults
function M.setup(user_config)
	user_config = user_config or {}
	M.options = vim.tbl_deep_extend("force", M.options, user_config)
	-- You might want to re-apply the theme here if config changes colors
	-- require('rider-melon.theme').load()
end

return M
