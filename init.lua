-- ##########################
-- MAP LEADER
-- ##########################

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


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
-- BACKUP 
-- ###########################

--require("config/backup")

-- ###########################
-- Autocargado de parses para cuando nvim se actualize 
-- ###########################

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyDone",
    callback = function()
        vim.cmd("TSUpdate")
    end,
})
