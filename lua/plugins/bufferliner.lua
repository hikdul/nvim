-- ###################################################
-- Este plug genera las pestanas en el nivel superiar para ver los archivos abiertos en el buffer
-- Viene del repo
-- >> https://github.com/akinsho/bufferline.nvim <<
--
-- ###################################################

return {
	'akinsho/bufferline.nvim',
	version = "*", 
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup{
			options = {
				show_buffer_cloze_icons = false,
			}
		}
	end
}
