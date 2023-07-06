local M = {}

function M.config()
  require("notify").setup {
    stages = "fade_in_slide_out",
    background_colour = "FloatShadow",
    timeout = 3000,
  }
  vim.notify = require "notify"
end

return M
