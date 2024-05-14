---@type LazySpec
return {

	-- == Examples of Adding Plugins ==

	-- "andweeb/presence.nvim",
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function() require("lsp_signature").setup() end,
	-- },

	-- == Examples of Overriding Plugins ==

	-- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				" █████  ███████ ████████ ██████   ██████",
				"██   ██ ██         ██    ██   ██ ██    ██",
				"███████ ███████    ██    ██████  ██    ██",
				"██   ██      ██    ██    ██   ██ ██    ██",
				"██   ██ ███████    ██    ██   ██  ██████",
				" ",
				"    ███    ██ ██    ██ ██ ███    ███",
				"    ████   ██ ██    ██ ██ ████  ████",
				"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
				"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
				"    ██   ████   ████   ██ ██      ██",
			}
			return opts
		end,
	},

	-- -- You can disable default plugins as follows:
	-- { "max397574/better-escape.nvim", enabled = false },

	-- -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	-- {
	--   "L3MON4D3/LuaSnip",
	--   config = function(plugin, opts)
	--     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- add more custom luasnip configuration such as filetype extend or custom snippets
	--     local luasnip = require "luasnip"
	--     luasnip.filetype_extend("javascript", { "javascriptreact" })
	--   end,
	-- },

	-- {
	--   "windwp/nvim-autopairs",
	--   config = function(plugin, opts)
	--     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- add more custom autopairs configuration such as custom rules
	--     local npairs = require "nvim-autopairs"
	--     local Rule = require "nvim-autopairs.rule"
	--     local cond = require "nvim-autopairs.conds"
	--     npairs.add_rules(
	--       {
	--         Rule("$", "$", { "tex", "latex" })
	--           -- don't add a pair if the next character is %
	--           :with_pair(cond.not_after_regex "%%")
	--           -- don't add a pair if  the previous character is xxx
	--           :with_pair(
	--             cond.not_before_regex("xxx", 3)
	--           )
	--           -- don't move right when repeat character
	--           :with_move(cond.none())
	--           -- don't delete if the next character is xx
	--           :with_del(cond.not_after_regex "xx")
	--           -- disable adding a newline when you press <cr>
	--           :with_cr(cond.none()),
	--       },
	--       -- disable for .vim files, but it work for another filetypes
	--       Rule("a", "a", "-vim")
	--     )
	--   end,
	-- },

	--- from nvim-user
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({ hint_prefix = "🌵 " })
		end,
	},
	{
		"https://github.com/adelarsq/image_preview.nvim",
		event = "VeryLazy",
		config = function()
			require("image_preview").setup()
		end,
	},
	{
		"kchmck/vim-coffee-script",
		ft = "coffee",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			term_colors = true,
			dim_inactive = {
				enabled = true,
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#101010",
					crust = "#66a6a6",
				},
			},
			custom_highlights = {
				CursorLine = {
					bg = "#06154a",
				},
			},
			integrations = {
				neotree = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},
	{
		"mg979/vim-visual-multi",
		event = "BufRead",
	},
	{
		"okuuva/auto-save.nvim",
		event = { "User AstroFile", "InsertEnter" },
		opts = {
			trigger_events = {
				immediate_save = { "BufLeave", "FocusLost" },
				defer_save = {},
			},
		},
	},
}
