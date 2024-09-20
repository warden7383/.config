-- vim.o.timeout = true
-- vim.o.timeoutlen = 1000
-- -- disabling some operators: (must run before setup())
-- local presets = require("which-key.plugins.presets")
--
-- presets.operators["d"] = nil

-- require("which-key").setup({
-- 	plugins = {
-- 		marks = true, -- shows a list of your marks on ' and `
-- 		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
-- 		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
-- 		-- No actual key bindings are created
-- 		spelling = {
-- 			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
-- 			suggestions = 20, -- how many suggestions should be shown in the list?
-- 		},
-- 		presets = {
-- 			operators = true, -- adds help for operators like d, y, ...
-- 			motions = true, -- adds help for motions
-- 			text_objects = true, -- help for text objects triggered after entering an operator
-- 			windows = true, -- default bindings on <c-w>
-- 			nav = true, -- misc bindings to work with windows
-- 			z = true, -- bindings for folds, spelling and others prefixed with z
-- 			g = true, -- bindings for prefixed with g
-- 		},
-- 	},
-- 	-- add operators that will trigger motion and text object completion
-- 	-- to enable all native operators, set the preset / operators plugin above
-- 	operators = {
-- 		gc = "Comments",
-- 	},
-- 	key_labels = {
-- 		-- override the label used to display some keys. It doesn't effect WK in any other way.
-- 		-- For example:
-- 		["<space>"] = "SPC",
-- 		-- ["<cr>"] = "RET",
-- 		["<tab>"] = "TAB",
-- 	},
-- 	motions = {
-- 		count = true,
-- 	},
-- 	icons = {
-- 		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
-- 		separator = "➜", -- symbol used between a key and it's label
-- 		group = "+", -- symbol prepended to a group
-- 	},
-- 	popup_mappings = {
-- 		scroll_down = "<c-d>", -- binding to scroll down inside the popup
-- 		scroll_up = "<c-u>", -- binding to scroll up inside the popup
-- 	},
-- 	window = {
-- 		border = "double", -- none, single, double, shadow
-- 		position = "bottom", -- bottom, top
-- 		margin = { 0, 10, 1, 10 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
-- 		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
-- 		winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
-- 		zindex = 1000, -- positive value to position WhichKey above other floating windows.
-- 	},
-- 	layout = {
-- 		height = { min = 4, max = 25 }, -- min and max height of the columns
-- 		width = { min = 20, max = 50 }, -- min and max width of the columns
-- 		spacing = 2, -- spacing between columns
-- 		align = "center", -- align columns left, center or right
-- 	},
-- 	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
-- 	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
-- 	show_help = true, -- show a help message in the command line for using WhichKey
-- 	show_keys = true, -- show the currently pressed key and its label as a message in the command line
-- 	triggers = "auto", -- automatically setup triggers
-- 	-- triggers = {"<leader>"} -- or specifiy a list manually
-- 	-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
-- 	triggers_nowait = {
-- 		-- marks
-- 		"`",
-- 		"'",
-- 		"g`",
-- 		"g'",
-- 		-- registers
-- 		'"',
-- 		"<c-r>",
-- 		-- spelling
-- 		"z=",
-- 	},
-- 	triggers_blacklist = {
-- 		-- list of mode / prefixes that should never be hooked by WhichKey
-- 		-- this is mostly relevant for keymaps that start with a native binding
-- 		i = { "j", "k" },
-- 		v = { "j", "k" },
-- 	},
-- 	-- disable the WhichKey popup for certain buf types and file types.
-- 	-- Disabled by default for Telescope
-- 	disable = {
-- 		buftypes = {},
-- 		filetypes = { "NvimTree" },
-- 	},
-- })


---@class wk.Opts
local config = {
  ---@type false | "classic" | "modern" | "helix"
  preset = "modern",
  -- Delay before showing the popup. Can be a number or a function that returns a number.
  ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
  delay = function(ctx)
    return ctx.plugin and 0 or 1000
  end,
  ---@param mapping wk.Mapping
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
  --- You can add any mappings here, or use `require('which-key').add()` later
  ---@type wk.Spec
  spec = {},
  -- show a warning when issues were detected with your mappings
  notify = true,
  -- Which-key automatically sets up triggers for your mappings.
  -- But you can disable this and setup the triggers manually.
  -- Check the docs for more info.
  ---@type wk.Spec
  triggers = {
    { "<auto>", mode = "nxso" },
  },
  -- Start hidden and wait for a key to be pressed before showing the popup
  -- Only used by enabled xo mapping modes.
  ---@param ctx { mode: string, operator: string }
  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  ---@type wk.Win.opts
  win = {
    -- don't allow the popup to overlap with the cursor
    no_overlap = true,
    -- width = 1,
    -- height = { min = 4, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = "none",
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    width = { min = 20 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  ---@type (string|wk.Sorter)[]
  --- Mappings are sorted using configured sorters and natural sort of the keys
  --- Available sorters:
  --- * local: buffer-local mappings first
  --- * order: order of the items (Used by plugins like marks / registers)
  --- * group: groups last
  --- * alphanum: alpha-numerical first
  --- * mod: special modifier keys last
  --- * manual: the order the mappings were added
  --- * case: lower-case first
  sort = { "local", "order", "group", "alphanum", "mod" },
  ---@type number|fun(node: wk.Node):boolean?
  expand = 0, -- expand groups when <= n mappings
  -- expand = function(node)
  --   return not node.desc -- expand all nodes without a description
  -- end,
  -- Functions/Lua Patterns for formatting the labels
  ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
      -- { "<Space>", "SPC" },
    },
    desc = {
      { "<Plug>%(?(.*)%)?", "%1" },
      { "^%+", "" },
      { "<[cC]md>", "" },
      { "<[cC][rR]>", "" },
      { "<[sS]ilent>", "" },
      { "^lua%s+", "" },
      { "^call%s+", "" },
      { "^:%s*", "" },
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
    -- set to false to disable all mapping icons,
    -- both those explicitly added in a mapping
    -- and those from rules
    mappings = true,
    --- See `lua/which-key/icons.lua` for more details
    --- Set to `false` to disable keymap icons from rules
    ---@type wk.IconRule[]|false
    rules = {},
    -- use the highlights from mini.icons
    -- When `false`, it will use `WhichKeyIcon` instead
    colors = true,
    -- used by key format
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  -- disable WhichKey for certain buf types and file types.
  disable = {
    ft = {},
    bt = {},
  },
  debug = false, -- enable wk.log in the current directory
}

require("which-key").setup(config)
