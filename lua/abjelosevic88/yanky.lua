local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")

require("yanky").setup({
  picker = {
    telescope = {
      mappings = {
        default = mapping.set_register(utils.get_default_register()),
        i = {
          ["<c-p>"] = mapping.put("p"),
          ["<c-k>"] = mapping.put("P"),
          ["<c-x>"] = mapping.delete(),
          ["<c-m>"] = mapping.set_register(utils.get_default_register()),
        },
        n = {
          p = mapping.put("p"),
          P = mapping.put("P"),
          d = mapping.delete(),
          r = mapping.set_register(utils.get_default_register())
        },
      }
    }
  }
})
