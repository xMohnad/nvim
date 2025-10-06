return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("lspsaga").setup({
			lightbulb = { enable = true },
		})
		local map = vim.keymap.set

		map("n", "gK", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Lspsaga: hover doc" })

		-- Code actions
		map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })

		-- Peek definition / type definition
		map("n", "gpd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
		map("n", "gpt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })

		-- Diagnostics
		map("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
		map("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
		map("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })

		-- Outline
		map("n", "gro", "<cmd>Lspsaga outline<CR>", { desc = "Symbols Outline" })

		-- Floating terminal
		map("n", "<leader>t", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle Terminal" })

		-- Win bar
		map("n", "<leader>wb", "<cmd>Lspsaga winbar_toggle<CR>", { desc = "Toggle Winbar" })
	end,
}
