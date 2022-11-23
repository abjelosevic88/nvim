local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save file
keymap("n", "<C-s>", ":w<CR>", opts)

-- Don't yank with x
keymap("n", "x", '"_x', opts)

-- Select all
keymap("n", "<C-x>", "gg<S-v>G", opts)

-- Open file browser
keymap("n", "<S-h>", "<cmd>Telescope file_browser path=%:p:h<cr>", opts)

-- Open file finder
keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)

-- Hop
keymap("n", "<C-g>", "<cmd>HopChar2<cr>", opts)
keymap("n", "<C-b>", "<cmd>HopWord<cr>", opts)
keymap("n", "<C-e>", "<cmd>HopPattern<cr>", opts)

-- Diagnostics
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Moving  shortcuts
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "<S-C-d>", "5j", opts)
keymap("n", "<S-C-u>", "5k", opts)

-- Resize
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-p>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-0>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Git
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-1<CR>gv-gv", opts)
