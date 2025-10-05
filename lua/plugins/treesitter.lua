return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "python", "markdown", "markdown_inline", "luadoc", "printf", "vim", "vimdoc" },
			sync_install = true,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				use_languagetree = true,
			},

			markdown = {
				enable = true,
				-- configuration here or nothing for defaults
			},
			indent = { enable = true },
			fold = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"cachebag/nvim-tcss",
		ft = "tcss",
		config = true,
	},
}
