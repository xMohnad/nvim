return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		ensure_installed = { "lua_ls", "basedpyright" },
	},
}
