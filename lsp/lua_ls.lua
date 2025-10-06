---@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	Lua = {
		runtime = { version = "LuaJIT" },
		workspace = {
			library = {
				vim.fn.expand("$VIMRUNTIME/lua"),
				"${3rd}/luv/library",
			},
		},
	},
}
