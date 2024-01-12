-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1 -- moved to the start of init.lua
-- vim.g.loaded_netrwPlugin = 1 -- moved to the start of init.lua

-- set termguicolors to enable highlight groups

-- empty setup using defaults
----require("nvim-tree").setup()

-- OR setup with some options
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  view = {
    float = {
        enable = true;
        open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w)/2
            local center_y = ((vim.opt.lines:get() - window_h) / 2 ) - vim.opt.cmdheight:get()

            return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
            }
        end,

    },
    width = function()
        return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
        enable = true,

    }
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
      enable = true,
      show_on_dirs = true,
  },
  update_focused_file = {
      enable = true,
      update_root = true,
  }
})

vim.keymap.set('n', '<leader>d', '<cmd>NvimTreeFindFileToggle<CR>', {silent = true})
