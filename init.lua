-- ##########################
-- MAP LEADER
-- ##########################

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Path to use dotnet
vim.env.PATH = vim.env.PATH .. ':/usr/bin'

-- ###########################
-- PLUGS 
-- ###########################

require("config/lazy")

-- ###########################
-- BASIC 
-- ###########################

require("config/options")

-- ###########################
-- KEYMAPS 
-- ###########################

require("config/keymaps")


-- ###########################
-- Autocargado de parses para cuando nvim se actualize 
-- ###########################

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyDone",
    callback = function()
        vim.cmd("TSUpdate")
    end,
})
