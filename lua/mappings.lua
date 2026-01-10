local map = vim.keymap.set

local function create_mappings(modes, lhs, rhs_table, desc)
	for _, mode in ipairs(modes) do
		local rhs = rhs_table[mode]
		if rhs then
			map(mode, lhs, rhs, { desc = desc })
		end
	end
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", "<C-y>", '"+y', { desc = "Yank to system clipboard" })
map({ "i", "n", "v" }, "<C-p>", '"*p', { desc = "Paste form system clipboard" })
map("n", "<leader>s", "<CMD>update<CR>", { desc = "Save current buffer" })
map("n", "<leader><leader>q", "<CMD>q<CR>", { desc = "Quit current window" })
map("i", "<C-c>", "<ESC>", { desc = "Exit insert mode" })

-- Move line up
create_mappings({ "n", "i", "v" }, "<A-Up>", {
	n = ":m .-2<CR>==",
	i = "<Esc>:m .-2<CR>==gi",
	v = ":m '<-2<CR>gv=gv",
}, "Move line up")

-- Move line down
create_mappings({ "n", "i", "v" }, "<A-Down>", {
	n = ":m .+1<CR>==",
	i = "<Esc>:m .+1<CR>==gi",
	v = ":m '>+1<CR>gv=gv",
}, "Move line down")

-- Copy line up with Alt + Ctrl + Up
create_mappings({ "n", "i", "v" }, "<C-A-Up>", {
	n = ":t .-1<CR>",
	i = "<Esc>:t .-1<CR>gi",
	v = ":t '<-1<CR>gv=gv",
}, "Copy line up")

-- Copy line down with Alt + Ctrl + Down
create_mappings({ "n", "i", "v" }, "<C-A-Down>", {
	n = ":t .+0<CR>",
	i = "<Esc>:t .+0<CR>gi",
  v = ":t '>+0<CR>gv=gv",
}, "Copy line down")


map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
