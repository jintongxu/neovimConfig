-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "gp", "<c-t>", { desc = "ctrl-t" })
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "<leader>ms", "<cmd>w<cr>", { desc = "save file" })
vim.keymap.set("i", ";;", "<C-o>A;")
