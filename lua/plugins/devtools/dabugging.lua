return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
	},

	config = function()
		local dapvt = require("nvim-dap-virtual-text")
		local dap, ui = require("dap"), require("dapui")
		local dappy = require("dap-python")

		dappy.setup()
		dapvt.setup({ commented = true })
		ui.setup()

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end

		vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

		local map = vim.keymap.set

		map("n", "<leader>dt", dap.toggle_breakpoint, {
			desc = "Toggle Breakpoint",
		})
		map("n", "<leader>dr", dap.continue, {
			desc = "Continue",
		})
		map("n", "<leader>de", dap.step_out, { desc = "Step Out" })
		map("n", "<leader>do", dap.step_over, { desc = "Step Over" })
	end,
}
