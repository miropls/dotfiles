-- lua/config/keymaps.lua

-- Remove default gr* LSP keymaps added in Neovim 0.11
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grt")

-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank motion to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- macOS Cmd+V paste support
vim.keymap.set("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.keymap.set("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.keymap.set("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.keymap.set("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- Diagnostics (global -- available regardless of LSP attachment)
vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Go to prev diagnostic" })
vim.keymap.set("n", "<leader>ni", "<cmd>checkhealth vim.lsp<cr>", { desc = "LSP health check" })

-- Lazy
vim.keymap.set("n", "<leader>lu", "<cmd>Lazy update<cr>", { desc = "Lazy update" })
vim.keymap.set("n", "<leader>lo", "<cmd>Lazy<cr>", { desc = "Lazy open" })
