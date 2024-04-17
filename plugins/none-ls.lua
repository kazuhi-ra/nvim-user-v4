---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    config.sources = {
      -- null_ls.builtins.formatting.prettier,
    }
    return config
  end,
}
