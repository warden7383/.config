return {
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugin.webdevicons")
		end,
		lazy = true,
	},

	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
		lazy = true,
	},

	{
		"famiu/bufdelete.nvim",
		lazy = true,
		keys = {
			{ "<leader>q", ":Bdelete<CR>", desc = "Delete the buffer without losing layout" },
		},
		config = function()
			vim.keymap.set(
				"n",
				"<leader>q",
				":Bdelete<CR>",
				{ silent = true },
				{ desc = "Delete buffer without losing layout" }
			)
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		lazy = true,
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"farmergreg/vim-lastplace",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
	},

	{
		"wakatime/vim-wakatime",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
	},

	-- install this plugin (https://github.com/willothy/wezterm.nvim) when trying wezterm
	-- {
	--   'willothy/wezterm.nvim',
	--   config = true
	-- },

	{
		"goolord/alpha-nvim",
		lazy = true,
		event = "VimEnter",
		config = function()
			require("plugin.alpha")
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.toggleterm")
		end,
	},

	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })
		end,
		lazy = true,
		-- event = "CmdlineEnter",
		cmd = { "IconPickerYank", "IconPickerInsert", "IconPickerNormal" },
		dependencies = {
			"stevearc/dressing.nvim",
		},
	},

	{
		"rmagatti/auto-session",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		-- cmd = { "Autosession", "SessionRestore" },
		cmd = { "SessionSearch", "SessionRestore" },
		config = function()
			require("plugin.auto-session")
		end,
		-- dependencies = {
		-- 	"stevearc/dressing.nvim",
		-- },
	},

	{
		"folke/which-key.nvim",
		event = { "BufReadPre", "BufAdd" },
		lazy = true,
		-- keys = {
		-- 	{ "<leader>" },
		-- },
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function()
			require("plugin.which-key")
		end,
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{ "<leader>fd", desc = "Telescope file browser" },
			{ "<leader>d", desc = "Telescope file browser on current buffer path" },
		},
	},

	{
		"NStefan002/2048.nvim",
		cmd = "Play2048",
		config = true,
		lazy = true,
	},

	{
		"nanotee/zoxide.vim",
		lazy = true,
		cmd = { "Z", "Zi", "Lz", "Tz", "Lzi", "Tzi" },
	},

	{
		"stevearc/oil.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd", "CmdlineEnter" },
		-- event = "VeryLazy",
		-- opts = {},
		keys = {
			{ "<leader>of", desc = "Open Oil as Floating window" },
			{ "<leader>ob", desc = "Open Oil as Buffer" },
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.oil")
		end,
	},

	{
		"stevearc/conform.nvim",
		-- opts = {},
		-- event = {"BufReadPre", "BufAdd"},
		event = { "BufWritePre" }, -- Recommended by conform docs
		cmd = { "ConformInfo" },
		config = function()
			require("plugin.conform")
		end,
		lazy = true,
	},

	--   TODO: Configure this ai tool(requires api keys)
	--
	--   https://github.com/yetone/avante.nvim?tab=readme-ov-file
	-- {
	--   "yetone/avante.nvim",
	--   event = "VeryLazy",
	--   lazy = false,
	--   version = false, -- set this if you want to always pull the latest change
	--   opts = {
	--     -- add any opts here
	--   },
	--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	--   build = "make",
	--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	--   dependencies = {
	--     "stevearc/dressing.nvim",
	--     "nvim-lua/plenary.nvim",
	--     "MunifTanjim/nui.nvim",
	--     --- The below dependencies are optional,
	--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	--     "zbirenbaum/copilot.lua", -- for providers='copilot'
	--     {
	--       -- support for image pasting
	--       "HakonHarnes/img-clip.nvim",
	--       event = "VeryLazy",
	--       opts = {
	--         -- recommended settings
	--         default = {
	--           embed_image_as_base64 = false,
	--           prompt_for_file_name = false,
	--           drag_and_drop = {
	--             insert_mode = true,
	--           },
	--           -- required for Windows users
	--           use_absolute_path = true,
	--         },
	--       },
	--     },
	--     {
	--       -- Make sure to set this up properly if you have lazy=true
	--       'MeanderingProgrammer/render-markdown.nvim',
	--       opts = {
	--         file_types = { "markdown", "Avante" },
	--       },
	--       ft = { "markdown", "Avante" },
	--     },
	--   },
	-- }
}
