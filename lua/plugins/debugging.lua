-- ################################################################
-- VERIFICAR LAS DOCS, ESTA BUENO ESTO
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/rcarriga/nvim-dap-ui
-- Igual por ahora solo esta configurado para c#. buscar configurar para los otros lenguajes
-- JS y TS
-- RUST
-- ################################################################

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui"
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.keymap.set("n", "<Leader>bb", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>bn", dap.continue, {})

		-- popUp windows
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open(
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		-- config the dotnet serverwq
		dap.adapters.coreclr = {
			type = 'executable',
			command = '/usr/bin/netcoredbg',
			args = {'--interpreter=vscode'}
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
				end,
			},
		}
	end,
}
