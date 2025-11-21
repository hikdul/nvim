
-- ########################
-- basic commands
-- ########################
vim.keymap.set("n", " w", ":w<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " q", ":q<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " qw", ":qwa!<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " qa", ":qa!<CR>",{noremap = true,silent = true})

-- ########################
-- Tab commans
-- ########################
vim.keymap.set("n", " tb", ":bn<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " tn", ":bp<CR>",{noremap = true,silent = true})
vim.keymap.set("n", " tx", ":bd<CR>",{noremap = true,silent = true})
