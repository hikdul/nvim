-- ##############################################################################################
-- Para tener los markdown con mejor visual
-- TODO: Aun no se ha configurado, aca la documentacion: https://github.com/MeanderingProgrammer/render-markdown.nvim
-- ##############################################################################################

return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		heading = {
			width = 'block',
			min_width = 30,
			border = true,
			border_virtual = true,
		},
		quote = { 
			repeat_linebreak = true 
		},
		checkbox = {
			--unchecked = { icon = '✘ ' },
			--custom = { todo = { rendered = '◯ ' } },
			enabled = true,
			render_modes = false,
			bullet = false,
			left_pad = 0,
			right_pad = 1,
			unchecked = {
				icon = '✘ ',
				highlight = 'RenderMarkdownUnchecked',
				scope_highlight = nil,
			},
			checked = {
				icon = '✔ ',
				highlight = 'RenderMarkdownChecked',
				scope_highlight = nil,
			},
			custom = {
				todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
			},
			custom = {
				ntodo = { raw = '[~]', rendered = '◯ ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
			},
			scope_priority = nil,
		}, -- end checked changes
		latex = {
			enabled = true,
			render_modes = false,
			converter = { 'utftex', 'latex2text' },
			highlight = 'RenderMarkdownMath',
			position = 'center',
			top_pad = 0,
			bottom_pad = 0,
		},-- end latex
		link = {
			enabled = true,
			render_modes = false,
			footnote = {
				enabled = true,
				icon = '󰯔 ',
				superscript = true,
				prefix = '',
				suffix = '',
			},
			image = '󰥶 ',
			email = '󰀓 ',
			hyperlink = '󰌹 ',
			highlight = 'RenderMarkdownLink',
			highlight_title = 'RenderMarkdownLinkTitle',
			wiki = {
				icon = '󱗖 ',
				body = function()
					return nil
				end,
				highlight = 'RenderMarkdownWikiLink',
				scope_highlight = nil,
			},
			custom = {
				web = { pattern = '^http', icon = '󰖟 ' },
				apple = { pattern = 'apple%.com', icon = ' ' },
				discord = { pattern = 'discord%.com', icon = '󰙯 ' },
				github = { pattern = 'github%.com', icon = '󰊤 ' },
				gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
				google = { pattern = 'google%.com', icon = '󰊭 ' },
				hackernews = { pattern = 'ycombinator%.com', icon = ' ' },
				linkedin = { pattern = 'linkedin%.com', icon = '󰌻 ' },
				microsoft = { pattern = 'microsoft%.com', icon = ' ' },
				neovim = { pattern = 'neovim%.io', icon = ' ' },
				reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
				slack = { pattern = 'slack%.com', icon = '󰒱 ' },
				stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
				steam = { pattern = 'steampowered%.com', icon = ' ' },
				twitter = { pattern = 'x%.com', icon = ' ' },
				wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
				youtube = { pattern = 'youtube[^.]*%.com', icon = '󰗃 ' },
				youtube_short = { pattern = 'youtu%.be', icon = '󰗃 ' },
			},
		}, -- end to link config

	}, --end opts 
}
