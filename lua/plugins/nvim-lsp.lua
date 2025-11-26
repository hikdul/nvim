-- ####################################
-- configuracion doc nvim: https://neovim.io/doc/user/lsp.html
-- Configuracion y plug que se esta usando: https://github.com/neovim/nvim-lspconfig
-- ####################################

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"Hoffs/omnisharp-extended-lsp.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local omnisharp_extended = require("omnisharp_extended")

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


		-- 🟦 Configuración manual de OmniSharp
		lspconfig.omnisharp.setup({
			cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },

			-- Config Extras
			enable_import_completion = true,
			enable_roslyn_analyzers = true,
			organize_imports_on_format = true,

			-- 👇 Esto habilita definiciones, implementations, references extendidas
			handlers = {
				["textDocument/definition"]      = omnisharp_extended.definitionHandler,
				["textDocument/typeDefinition"]  = omnisharp_extended.typeDefinitionHandler,
				["textDocument/references"]      = omnisharp_extended.referencesHandler,
				["textDocument/implementation"]  = omnisharp_extended.implementationHandler,
			},
		})
	end
}
