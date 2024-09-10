---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	-- theme
	{ import = "astrocommunity.colorscheme.catppuccin" },

	-- language
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.prisma" },

	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.yaml" },

	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.terraform" },

	{ import = "astrocommunity.pack.lua" },

	-- editing-support
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.vim-move" },
	{ import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },

	-- completion
	{ import = "astrocommunity.completion.copilot-lua-cmp" },

	-- scroll
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },

	-- motion
	{ import = "astrocommunity.motion.nvim-surround" },
}
