-- ####################################
-- Configura el treesitter para que lea los lenguajes mencionados
-- Se descarga del siguient repo
-- https://github.com/nvim-treesitter/nvim-treesitter
-- ####################################

return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require'nvim-treesitter.configs'.setup {
			-- lista de lengujes a instalar
			ensure_installed = { 
				"python",
				"c",
				"c_sharp",
				"razor",
				"regex", 
				"html", 
				"css", 
				"scss",
				"javascript",
				"typescript",
				"tsx",
				"rust",
				"json",
				"json5",
				"lua",
				"vim",
				"vimdoc",
				"sql",
				"markdown",
				"markdown_inline",
				"bash",
				"hyprlang"
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end,
}
