local function _1_()
  local p_2_auto, m_3_auto = require("iron.nvim")
  if p_2_auto then
    return m_3_auto.setup({config = {}, keymaps = {send_motion = "<space>sc", visual_send = "<space>sc"}})
  else
    return nil
  end
end
local function _3_()
  local _let_4_ = require("null-ls")
  local present = _let_4_[1]
  local m = _let_4_[2]
  if present then
    return m.setup({debug = true, sources = {m.builtins.formatting.uncrustify, m.builtins.formatting.yapf}})
  else
    return nil
  end
end
local function _6_()
  local p_2_auto, m_3_auto = require("trouble")
  if p_2_auto then
    return m_3_auto.setup()
  else
    return nil
  end
end
local function _8_()
  local p_2_auto, m_3_auto = require("mini.move")
  if p_2_auto then
    return m_3_auto.setup({mappings = {left = "<Left>", right = "<Right>"}})
  else
    return nil
  end
end
local function _10_()
  local function _11_(client, buffer)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    do end (require("core.utils"))[load_mapping]("lspconfig", {buffer = bufnr})
    if client.server_capabilities.signatureHelpProvider then
      return (require("nvchad_ui.signature")).setup(client)
    else
      return nil
    end
  end
  return (require("jdtls")).start_or_attach({config = {cmd = {(os.getenv("HOME") .. "/.local/share/nvim/mason/bin/jdtls")}, root_dir = vim.fs.dirname((vim.fs.find({".gradlew", ".git", "mvnw"}, {upward = true}))[1]), on_attach = _11_}})
end
return {["tpope/vim-surround"] = {}, ["hkupty/iron.nvim"] = {config = _1_}, ["jose/null-ls.nvim"] = {config = _3_}, trouble = {config = _6_}, ["mini.move"] = {config = _8_}, ["nvim-jdtls"] = {ft = {"java"}, config = _10_}}
