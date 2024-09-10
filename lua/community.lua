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
}
