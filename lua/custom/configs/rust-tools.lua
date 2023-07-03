-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
--
--
-- local options = {
--   -- server = {
--   --   on_attach = on_attach,
--   --   capabilities = capabilities,
--   -- }
--   tools = {
--     autoSetHints = true,
--     inlay_hints = {
--       show_parameter_hints = true,
--       parameter_hints_prefix = "<- ",
--       other_hints_prefix = "=> "
--      }
--   },
--   server = {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     ["rust-analyzer"] = {
--       assist = {
--         importEnforceGranularity = true,
--         importPrefix = "create"
--       },
--       cargo = { allFeatures = true },
--       checkOnSave = {
--         -- default: `cargo check`
--         command = "clippy",
--         allFeatures = true
--       }
--     },
--     inlayHints = {
--       -- NOT SURE THIS IS VALID/WORKS 😬
--       lifetimeElisionHints = {
--         enable = true,
--         useParameterNames = true
--       }
--     }
--   }
-- }
--
-- return options
local rt = require "rust-tools"

rt.setup {
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
}
