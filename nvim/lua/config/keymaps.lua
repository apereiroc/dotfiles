-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word
keymap.set("n", "dw", "evbdi")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Delete buffer
keymap.set("n", "bd", ":bd<Return>", opts)

-- Next/Previous buffer
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":bnext<Return>", opts)
keymap.set("n", "<s-tab>", ":bprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- TODO
-- Resize window
-- keymap.set("n", "<C-s-up>", ":horizontal resize +2<Return>", opts)
-- keymap.set("n", "<C-s-down>", ":horizontal resize -2<Return>", opts)
-- keymap.set("n", "<C-s-left>", ":vertical resize +2<Return>", opts)
-- keymap.set("n", "<C-s-right>", ":vertical resize -2<Return>", opts)
--

-- Neotree
keymap.set("n", "-", ":Neotree<Return>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
