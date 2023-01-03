local M = {}

M.plugins = require("custom.plugins")

M.mappings = require("custom.mappings")

M.override = {
	["nvim-telescope/telescope.nvim"] = {
		extensions = {
			["ui-select"] = {},
		},
	},
}

return M
