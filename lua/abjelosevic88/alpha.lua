local alpha = safe_require("alpha")

if not alpha then
	return
end

local dashboard = safe_require("alpha.themes.dashboard")

if not dashboard then
	return
end

dashboard.section.header.val = {
	[[ ________        ___          ________   ___      ___ ___  _____ ______      ]],
	[[|\   __  \      |\  \        |\   ___  \|\  \    /  /|\  \|\   _ \  _   \    ]],
	[[\ \  \|\ /_     \ \  \       \ \  \\ \  \ \  \  /  / | \  \ \  \\\__\ \  \   ]],
	[[ \ \   __  \  __ \ \  \       \ \  \\ \  \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
	[[  \ \  \|\  \|\  \\_\  \       \ \  \\ \  \ \    / /   \ \  \ \  \    \ \  \ ]],
	[[   \ \_______\ \________\       \ \__\\ \__\ \__/ /     \ \__\ \__\    \ \__\]],
	[[    \|_______|\|________|        \|__| \|__|\|__|/       \|__|\|__|     \|__|]],
}

dashboard.section.buttons.val = {
	dashboard.button(
		"f",
		"  Find file",
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
	),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	return "“Premature optimization is the root of all evil.” – Donald Knuth"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
