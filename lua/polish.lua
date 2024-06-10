-- -- NeoVimを起動したらNeo-treeを開く
vim.cmd.Neotree("focus")

-- patch
local M = require('astrolsp')
local original_progress = M.progress

M.progress = function(data)
  if not data then
    vim.api.nvim_err_writeln("Error: data is nil in progress function")
    return
  end
  if not data.params then
    if data.result then
      data.params = data.result
    else
      vim.api.nvim_err_writeln("Error: data.params is nil in progress function")
      return
    end
  end

  original_progress(data)
end
