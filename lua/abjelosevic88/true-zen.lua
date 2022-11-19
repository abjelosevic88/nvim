local trueZen = safe_require("true-zen")

if not trueZen then
	return
end

trueZen.setup({
	modes = {
		ataraxis = {
			shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
			backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
			minimum_writing_area = { -- minimum size of main window
				width = 100,
				height = 100,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
		},
		minimalist = {
			options = {
				number = true,
				relativenumber = true,
				ruler = true,
			},
		},
	},
})
