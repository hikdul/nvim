-- ###########################
-- BASIC CONFIGURACION
-- ###########################

vim.opt.number = true -- muestra los numeros a la izq
vim.opt.relativenumber = true -- cuenta a partir de la ubicacion actual
vim.opt.cursorline = true -- resalta la linea actual
vim.opt.wrap = true -- limita el texto para que se vea en la siguiente linea
vim.opt.expandtab = false -- trabaja con tabulador en ves de espacios
vim.opt.tabstop = 4 -- cuantos espacion usa el tab
vim.opt.shiftwidth = 4 -- similar a la anterior
vim.opt.clipboard = "unnamedplus" -- sincroniza el portapapeles del SO con Nvim
vim.opt.swapfile = false -- desactiva la copia del texto de manera temporal. se quita para evitar subirlos al github
vim.opt.ignorecase = true -- ignora si es mayuscula o minuscula a la hora de realizar busquedas


-- ###########################
-- Bufferline
-- ###########################

vim.opt.termguicolors = true

-- ###########################
-- Agrega el texto virtual que indica errores y otros
-- ###########################

vim.diagnostic.config({
	vitual_text= true
})
