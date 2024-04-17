---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- lang
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },

  -- theme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- editing-support
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },

  -- scroll
  { import = "astrocommunity.scrolling.nvim-scrollbar" },

  -- motion
  { import = "astrocommunity.motion.nvim-surround" },
}
