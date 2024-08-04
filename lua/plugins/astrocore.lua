---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- Configure core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true,                              -- enable autopairs at start
			cmp = true,                                    -- enable completion at start
			diagnostics_mode = 3,                          -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true,                           -- highlight URLs at start
			notifications = true,                          -- enable notifications at start
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = true,
			underline = true,
		},
		-- vim options can be configured here
		options = {
			opt = {
				-- set to true or false etc.
				relativenumber = true, -- sets vim.opt.relativenumber
				number = true,     -- sets vim.opt.number
				spell = false,     -- sets vim.opt.spell
				signcolumn = "auto", -- sets vim.opt.signcolumn to auto
				wrap = false,      -- sets vim.opt.wrap
				foldcolumn = "0",
				laststatus = 0,
			},
			g = {
				mapleader = " ",             -- sets vim.g.mapleader
				autoformat_enabled = true,   -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
				cmp_enabled = true,          -- enable completion at start
				autopairs_enabled = true,    -- enable autopairs at start
				diagnostics_mode = 3,        -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
				icons_enabled = true,        -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
				ui_notifications_enabled = true, -- disable notifications when toggling UI elements
				resession_enabled = false,   -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
			},
		},

		mappings = {
			n = {
				["<leader>b"] = { name = "Buffers" },

				-- https://twitter.com/thinca/status/1200791599510245376
				["p"] = "]p",
				["P"] = "]P",

				["|"] = {
					function()
						vim.cmd.vsplit()
						require("smart-splits").move_cursor_left()
						require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
						require("smart-splits").move_cursor_right()
					end,
					desc = "Vertical Split",
				},

				-- enter で下スクロール
				["<C-m>"] = "<C-e>",

				-- 12行だけスクロール
				["<C-d>"] = "5<C-e>",
				["<C-u>"] = "5<C-y>",

				-- 矢印キーをよく使うやつに割り当て
				["<Up>"] = {
					function()
						local astro = require("astrocore")
						local worktree = astro.file_worktree()
						local flags = worktree
								and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir)
								or ""
						astro.toggle_term_cmd({ cmd = "lazygit " .. flags, direction = "float" })
					end,
					desc = "ToggleTerm lazygit",
				},

				-- ref: https://github.com/nvim-telescope/telescope.nvim/issues/605
				["<Down>"] = {
					function()
						local opts = {}
						opts.previewer = require("telescope.previewers").new_termopen_previewer({
							get_command = function(entry)
								return {
									"git",
									"-c",
									"core.pager=delta",
									"-c",
									"delta.side-by-side=true",
									"show",
									entry.value .. "^!",
									"--",
									entry.current_file,
								}
							end,
						})
						require("telescope.builtin").git_bcommits(opts)
					end,
					desc = "Git commits (current file)",
				},
				["<Left>"] = {
					function()
						require("telescope.builtin").find_files({ hidden = true })
					end,
				},
				["<Right>"] = {
					function()
						require("telescope.builtin").live_grep({
							additional_args = function()
								return { "--hidden", "--no-ignore" }
							end,
						})
					end,
					desc = "Find words in all files",
				},

				["<S-Up>"] = {
					function()
						require("astrocore").toggle_term_cmd("lazydocker")
					end,
					desc = "ToggleTerm lazydocker",
				},

				["<S-Down>"] = {
					function()
						require("gitsigns").blame_line({ full = true })
					end,
					desc = "View full Git blame",
				},

				-- 行頭・行末移動
				-- https://twitter.com/yuki_ycino/status/1336527468434317317
				["<S-h>"] = {
					"(getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^')",
					expr = true,
					remap = false,
					desc = "Next buffer",
				},
				["<S-l>"] = "$",

				["<C-Tab>"] = {
					function()
						require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
					end,
					desc = "Next buffer",
				},
				["<C-S-Tab>"] = {
					function()
						require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
					end,
					desc = "Previous buffer",
				},
				["<C-w>"] = {
					function()
						require("astrocore.buffer").close()
					end,
					desc = "Close buffer",
				},
				["E"] = {
					function()
						local file_path = vim.fn.expand("%:p")
						local tmux_command = "tmux popup -d '#{pane_current_path}' -w 99% -h 80% "
						local command = "'bundle exec rspeccc " .. file_path .. " | sed 1,2d | less -R'"
						pcall(vim.fn.system, tmux_command .. command)
					end,
					desc = "Run RSpec for current line",
				},
			},
			i = {
				["<C-b>"] = "<Left>",
				["<C-f>"] = "<Right>",
				["<C-p>"] = "<Up>",
				["<C-n>"] = "<Down>",
			},
			t = {
				["<C-h>"] = "<C-h>",
				["<C-c>"] = "<C-c>",
				["<C-l>"] = "<C-l>",
			},
		},
	},
}
