local telescope = safe_require("telescope")
local actions = safe_require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions
local yank_mappings = require("yanky.telescope.mapping")
local yank_utils = require("yanky.utils")

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
      },
      n = {
        ["q"] = actions.close,
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
  extensions = {
    file_browser = {
      path = "%:p:h",
      hijack_netrw = true,
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-n>"] = fb_actions.create,
          ["<C-o>"] = fb_actions.create_from_prompt,
          ["<C-c>"] = fb_actions.copy,
          ["<C-r>"] = fb_actions.rename,
          ["<C-d>"] = fb_actions.remove,
          ["<C-e>"] = fb_actions.move,
          ["<C-t>"] = fb_actions.change_cwd,
        },
        n = {
          ["<C-n>"] = fb_actions.create,
          ["<C-o>"] = fb_actions.create_from_prompt,
          ["<C-c>"] = fb_actions.copy,
          ["<C-r>"] = fb_actions.rename,
          ["<C-d>"] = fb_actions.remove,
          ["<C-e>"] = fb_actions.move,
          ["<C-t>"] = fb_actions.change_cwd,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      }
    }
  }
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("yank_history")
