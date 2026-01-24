-- ####################################
-- configuracion doc nvim: https://neovim.io/doc/user/lsp.html
-- Configuracion y plug que se esta usando: https://github.com/neovim/nvim-lspconfig
-- ####################################

return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable({
			"emmet_ls",
			"rust_analyzer",
			"ts_ls",
			"cssls",
			"tailwindcss",
		})
	end
}
