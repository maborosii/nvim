---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everforest",
  transparency = false,
  statusline = {
    theme = "default",
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
