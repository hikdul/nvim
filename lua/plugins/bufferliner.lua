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
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "none",

				--- ❌ No queremos iconos de cerrar
				show_close_icon = false,
				show_buffer_close_icons = false,

				--- ✔ Indicador del buffer actual
				indicator = {
					style = "icon",
					icon = "▎",
				},

				--- ✔ Ícono cuando el archivo está modificado
				modified_icon = "●",

				--- ✔ Ícono cuando el archivo es readonly
				--- aparecerá como un candado 🔒
				--- junto al nombre
				--- útil para buffers de sistema o root
				--- ej: sudoedit
				name_formatter = function(buf)
					local name = buf.name
					if vim.bo[buf.bufnr].readonly then
						name = " " .. name
					end
					return name
				end,

				--- ✔ Mostrar iconos de tipo de archivo (devicons)
				color_icons = true,
				show_buffer_icons = true,

				--- ✔ Diagnósticos por LSP con iconos personalizados
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icons = {
						error = " ",
						warning = " ",
						info = " ",
						hint = "󰌶 ",
					}
					local icon = icons[level] or " "
					return " " .. icon .. count
				end,

				--- ✔ Separadores estilo slant
				separator_style = "slant",

				--- ✔ Integración con Snacks Explorer
				offsets = {
					{
						filetype = "snacks_explorer",
						text = "  Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
				},

				--- Animaciones entre buffers (usando Snacks Animate)
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},

			--- 🎨 COLORES ESTILO GRUVBOX
			highlights = {
				--- buffer seleccionado
				buffer_selected = {
					fg = "#ebdbb2",
					bold = true,
					italic = false,
				},

				--- icono seleccionado
				buffer_visible = {
					fg = "#d5c4a1",
				},

				--- indicador del seleccionado (barra vertical)
				indicator_selected = {
					fg = "#fabd2f",
					bg = "#3c3836",
				},

				--- separadores
				separator = {
					fg = "#3c3836",
					bg = "#282828",
				},
				separator_selected = {
					fg = "#3c3836",
					bg = "#3c3836",
				},

				--- fondo general
				fill = {
					bg = "#282828",
				},

				--- modificado
				modified_selected = {
					fg = "#fabd2f",
					bold = true,
				},
				modified = {
					fg = "#fe8019",
				},

				--- diagnóstico
				error = { fg = "#fb4934" },
				warning = { fg = "#fabd2f" },
				info = { fg = "#83a598" },
			},
		})
	end
}

