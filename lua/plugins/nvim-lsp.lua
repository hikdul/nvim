-- ####################################
-- configuracion doc nvim: https://neovim.io/doc/user/lsp.html
-- Configuracion y plug que se esta usando: https://github.com/neovim/nvim-lspconfig
-- ####################################

return {
	"neovim/nvim-lspconfig",
	config = function()
  -- 🟦 Instalar LSPs automáticamente (tu código)
		vim.lsp.enable({
			"ts_ls",
			"csharp_ls",
			"docker_compose_language_service",
			"dockerls",
			"lua_ls",
			"emmet_ls",
			"nginx-language-server",
			"postgres_lsp",
			"rust_analyzer",
			"ts_ls",
			"stylua",
			"vimls",
			"cssls",
			"tailwindcss",
		})
	end
}
