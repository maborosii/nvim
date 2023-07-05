---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everforest",
  transparency = true,
  statusline = {
    theme = "default",
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
