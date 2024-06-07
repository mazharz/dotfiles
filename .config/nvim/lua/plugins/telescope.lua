local setupTelescope = function()
  local layout = require("telescope.actions.layout")
  local actions = require('telescope.actions')
  local builtin = require('telescope.builtin')

  require('telescope').setup {
    defaults = {
      prompt_prefix = "$ ",
      layout_strategy = 'flex',
      layout_config = {
        height = { padding = 0 },
        width = { padding = 0 }
      },
      mappings = {
        n = {
          ["<M-p>"] = layout.toggle_preview,
          ["<C-h>"] = actions.file_split,
          ["dd"] = actions.delete_buffer,
        },
        i = {
          ["<M-p>"] = layout.toggle_preview,
          ["<C-h>"] = actions.file_split,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<Del>"] = actions.delete_buffer,
        }
      },
      file_ignore_patterns = {
        "%.git",
      }
    }
  }
  -- make sure telescope uses fzf plugin
  require('telescope').load_extension('fzf')
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- plugin for better sort
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  keys = {
    {
      '<leader>sf', function()
      require('telescope.builtin').find_files({ hidden = true })
    end
    },
    { '<leader>sb', function() require('telescope.builtin').buffers() end },
    { '<leader>ss', function()
      require('telescope.builtin').live_grep({
        additional_args = {
          '--hidden',
        }
      })
    end },
    { '<leader>sc', function() require('telescope.builtin').commands() end },
    { '<leader>sd', function() require('telescope.builtin').diagnostics() end },
    { '<leader>sm', function() require('telescope.builtin').marks() end },
  },
  config = setupTelescope
}
