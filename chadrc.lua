local function _1_()
  local m = require("nvchad_ui.tabufline")
  return m.tabuflineNext()
end
return {plugins = require("custom.plugins"), mappings = {user = {n = {["<left>"] = {"<cmd> cprev <cr>", ""}, ["<leader>n"] = {_1_, "go to next buffer"}}}}}
