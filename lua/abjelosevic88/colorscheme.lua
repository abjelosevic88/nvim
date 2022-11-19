--[[ local catppuccin = safe_require("catppuccin") ]]
--[[ if not catppuccin then ]]
--[[ 	return ]]
--[[ end ]]
--[[]]
--[[ vim.g.catppuccin_flavour = "mocha" ]]
--[[]]
--[[ catppuccin.setup() ]]

local onedark = safe_require("onedarkpro")
if not onedark then
	return
end

onedark.setup()

vim.cmd([[colorscheme onedarkpro]])
