return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = function(_, config)
		config.sources = { "filesystem", "git_status" }
		config.filesystem.filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		}
		return config
	end,
}
