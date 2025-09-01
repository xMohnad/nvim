return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- "tabs"
				diagnostics = "nvim_lsp",
				separator_style = "slant",
			},
		})

		-- Keymaps for bufferline
		local map = vim.keymap.set
		map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
		map("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
		map("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick & close buffer" })
		map("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
		map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
		map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
		map("n", "<leader>bx", "<Cmd>bdelete<CR>", { desc = "Close current buffers" })
	end,
}
