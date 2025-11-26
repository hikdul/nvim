-- ####################################
-- Mantiene varios elementos
-- * Explorador de archivos
-- * picket para transportar, viajar y moverse entre archivos de manera rapida
-- * otros por explorar
-- La documentacion esta en el siguiente repo
-- >> https://github.com/folke/snacks.nvim <<
-- ####################################
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
					jump = { close = true },

					-- Panel a la derecha
					layout = {
						layout = {
							position = "right",
							width = 40,
							border = "rounded",
						},
					},

					-- Íconos (para carpetas & Git)
					icons = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "󰜌",

						git = {
							added = " ",
							modified = " ",
							deleted = " ",
						},
					},

					-- 🎨 Colores estilo Gruvbox
					highlights = {
						File       = { fg = "#ebdbb2" },  -- fg normal Gruvbox
						Folder     = { fg = "#83a598" },  -- blue
						FolderIcon = { fg = "#83a598" },  -- blue
						Selected   = { fg = "#282828", bg = "#fabd2f" }, -- selección amarillo
						GitAdded   = { fg = "#b8bb26" },
						GitDeleted = { fg = "#fb4934" },
						GitChanged = { fg = "#fe8019" },
					},

					win = {
						list = {
							border = "rounded",
							style = "minimal",
						},
					},
				},
			},
		},

		explorer = { enabled = true },
		-- animaciones

		scroll = {
			enabled = true,
			animate = {
				duration = { step = 10, total = 100 },
				easing = "linear",
			},
			animate_repeat = {
				delay = 50,
				duration = { step = 3, total = 20 },
				easing = "linear",
			},
		},
		-- otro elemento
		bigfile = {
			enabled = true,         -- activar este módulo
			size = 1024 * 1024,     -- umbral: qué tan grande tiene que ser el archivo (ej: 1 MB)
			notify = true,          -- avisar cuando se detecta un big file
			setup = function(ctx)
				-- `ctx.buf` es el buffer del archivo grande
				-- Aquí decides qué desactivar:
				vim.cmd("syntax clear")
				vim.opt_local.syntax = "OFF"
				-- si tienes treesitter, puedes detenerlo:
				if vim.treesitter then
					vim.treesitter.stop(ctx.buf)
				end
				-- puedes agregar más lógicas según lo necesites
			end,
		},
		dashboard = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys ={
	-- 🔍 Smart Picker
		{
			"<leader><space>",
			function() Snacks.picker.smart() end,
			desc = "Smart Find Files",
		},

		-- 🧩 Buffers
		{
			"<leader>bf",
			function() Snacks.picker.buffers() end,
			desc = "Buffers",
		},

		-- 🔎 Grep
		{
			"<leader>/",
			function() Snacks.picker.grep() end,
			desc = "Buscar texto",
		},

		-- 📁 Explorer
		{
			"<leader>nt",
			function() Snacks.explorer() end,
			desc = "File Explorer",
		},

		-- -----------------------------------------------
		-- 🚀 Navegación LSP usando Snacks Pickers
		-- -----------------------------------------------
		{
			"gd",
			function() Snacks.picker.lsp_definitions() end,
			desc = "Go to Definition (Snacks)",
		},

		{
			"gr",
			function() Snacks.picker.lsp_references() end,
			desc = "LSP References (Snacks)",
		},

		{
			"gi",
			function() Snacks.picker.lsp_implementations() end,
			desc = "LSP Implementations (Snacks)",
		},

		-- Hover normal del LSP
		{
			"K",
			function() vim.lsp.buf.hover() end,
			desc = "LSP Hover",
		},

		-- Signature Help
		{
			"<C-k>",
			function() vim.lsp.buf.signature_help() end,
			desc = "Signature Help",
		},

	} --end KEy's
}
