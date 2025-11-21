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
		picker = { enabled = true },
		explorer = { enabled = true },
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys ={
		-- Top Pickers & Explorer
		{ "<leader><space>", 
			function() Snacks.picker.smart() end, 
			desc = "Smart Find Files" 
		},
		{ "<leader>bf", 
			function() Snacks.picker.buffers() end, 
			desc = "Buffers" 
		},
		{ "<leader>/", 
			function() Snacks.picker.grep() end,
			desc = "busqueda de palabras en documentos" 
		},
		{ "<leader>nt", 
			function() Snacks.explorer() end, 
			desc = "File Explorer" 
		},
		-- other plug
 
	}
}
