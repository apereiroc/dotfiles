-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix conceal level for JSON files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "json" },
--   callback = function()
--     vim.wo.spell = false
--     vim.wo.conceallevel = 0
--   end,
-- })
