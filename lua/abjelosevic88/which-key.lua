local which_key = safe_require("which-key")

if not which_key then
	return
end

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = false,
	triggers = "auto",
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	silent = true,
	noremap = true,
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Explorer" },
	["w"] = { "<cmd>w<CR>", "Save" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["t"] = {
		name = "File Explorer",
		["t"] = { "<cmd>NvimTreeToggle<CR>", "Toggle" },
		["r"] = { "<cmd>NvimTreeRefresh<CR>", "Refresh" },
		["c"] = { "<cmd>NvimTreeClose<CR>", "Close" },
		["o"] = { "<cmd>NvimTreeCollapse<CR>", "Collapse" },
	},
	["b"] = {
		name = "Buffers",
		["l"] = { "<cmd>BufferLineCloseRight<CR>", "Close all to right" },
		["h"] = { "<cmd>BufferLineCloseLeft<CR>", "Close all to left" },
		["d"] = { "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>", "Close Current" },
		["m"] = { "<cmd>BufferLineCloseRight<CR><cmd>BufferLineCloseLeft<CR>", "Close except active" },
	},
	["x"] = { "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>", "Close buffer" },
	["f"] = {
		name = "Find",
		["s"] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Text" },
		["r"] = { "<cmd>:Telescope oldfiles <CR>", "Recent files" },
		["f"] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Files" },
		["h"] = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help tags" },
		["b"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
		["l"] = { "<cmd>:Telescope file_browser <CR>", "File browser root folder" },
		["j"] = { "<cmd>:Telescope file_browser path=%:p:h <CR>", "File browser current folder" },
	},
	["g"] = {
		name = "Git",
		["s"] = { "<cmd>lua require('telescope.builtin').git_status()<CR>", "Status" },
		["c"] = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "Commits" },
		["b"] = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", "Branches" },
		["g"] = { "<cmd>Git<CR>", "Fugitive" },
		["r"] = { "<cmd>Gread<CR>", "Checkout file" },
		["a"] = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
		["d"] = { ":Gitsigns reset_hunk<CR>", "Reset hunk" },
	},
	["d"] = {
		name = "Diff View",
		["o"] = { "<cmd>DiffviewOpen<CR>", "Open" },
		["c"] = { "<cmd>DiffviewClose<CR>", "Close" },
	},
	["v"] = {
		name = "Resize",
		["j"] = { ":resize -2<CR>", "Resize down" },
		["k"] = { ":resize +2<CR>", "Resize up" },
		["h"] = { ":vertical resize -2<CR>", "Resize left" },
		["l"] = { ":vertical resize +2<CR>", "Resize right" },
	},
	["h"] = {
		name = "Hop",
		["h"] = { "<cmd>HopChar2<cr>", "2 Chars" },
		["f"] = { "<cmd>HopChar1<cr>", "1 Chars" },
		["p"] = { "<cmd>HopPattern<cr>", "Pattern" },
		["l"] = { "<cmd>HopLineStart<cr>", "Line start" },
		["v"] = { "<cmd>HopVertical<cr>", "Vertical" },
		["w"] = { "<cmd>HopWord<cr>", "Word" },
	},
	["p"] = {
		name = "Packer",
		["s"] = { "<cmd>PackerSync<CR>", "Sync" },
		["i"] = { "<cmd>PackerInstall<CR>", "Install" },
		["u"] = { "<cmd>PackerUpdate<CR>", "Update" },
		["c"] = { "<cmd>PackerCompile<CR>", "Compile" },
	},
	["m"] = { "<cmd>Glow<CR>", "Preview Markdown" },
	["n"] = { "<cmd>nohl<CR>", "No Highlight" },
	["z"] = { "<cmd>TZMinimalist<CR>", "Zen mode" },
	["s"] = {
		name = "TypeScript",
		["a"] = { "<cmd>TypescriptAddMissingImports<CR>", "Add missing imports" },
		["o"] = { "<cmd>TypescriptOrganizeImports<CR>", "Organize imports" },
		["u"] = { "<cmd>TypescriptRemoveUnused<CR>", "Remove unused" },
		["f"] = { "<cmd>EslintFixAll<CR>", "Fix all" },
		["g"] = { "<cmd>TypescriptGoToSourceDefinition<CR>", "Go to source definition" },
		["r"] = { "<cmd>TypescriptRenameFile<CR>", "Rename file" },
	},
	["l"] = {
		name = "LSP",
		["t"] = {
			name = "TypeScript",
			["a"] = { "<cmd>TypescriptAddMissingImports<CR>", "Add missing imports" },
			["o"] = { "<cmd>TypescriptOrganizeImports<CR>", "Organize imports" },
			["u"] = { "<cmd>TypescriptRemoveUnused<CR>", "Remove unused" },
			["f"] = { "<cmd>TypescriptFixAll<CR>", "Fix all" },
			["g"] = { "<cmd>TypescriptGoToSourceDefinition<CR>", "Go to source definition" },
			["r"] = { "<cmd>TypescriptRenameFile<CR>", "Rename file" },
		},
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
