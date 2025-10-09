return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable({ "lua_ls", "basedpyright", "fish_lsp"  })
	end,
}
