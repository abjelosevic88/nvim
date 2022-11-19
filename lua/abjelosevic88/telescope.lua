local telescope = safe_require("telescope")
local actions = safe_require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

if not telescope then
	return
end

if not actions then
	return
end

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			".git/",
			"node_modules/*",
		},
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-n>"] = fb_actions.create,
				["<C-o>"] = fb_actions.create_from_prompt,
				["<C-c>"] = fb_actions.copy,
				["<C-r>"] = fb_actions.rename,
				["<C-d>"] = fb_actions.remove,
				["<C-e>"] = fb_actions.move,
				["<C-t>"] = fb_actions.change_cwd,
			},
			n = {
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
		},
	},
})

require("telescope").load_extension("file_browser")
