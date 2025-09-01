return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      file_ignore_patterns = { "__pycache__", ".venv" },
      layout_config = { prompt_position = "top" },
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
        i = { -- Insert mode mappings
          ["<C-j>"] = require('telescope.actions').move_selection_next,
          ["<C-k>"] = require('telescope.actions').move_selection_previous,

        },
      }
    },
  },
}
