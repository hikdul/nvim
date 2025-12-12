
-- ########################
-- basic commands
-- ########################
vim.keymap.set("n", " w", ":w<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " ww", ":wa!<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " q", ":qa<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " wq", ":wqa!<CR>",{noremap = true,silent = true})

-- ########################
-- Tab commans
-- ########################
vim.keymap.set("n", " tb", ":bn<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " tn", ":bp<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " tx", ":bd<CR>",{noremap = true,silent = true})


-- ########################
-- Mov commans
-- ########################
vim.keymap.set("n", "<C-l>", "10l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "10h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "10k", { noremap = true, silent = true })
