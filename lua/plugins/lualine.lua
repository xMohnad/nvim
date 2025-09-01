-- lualine config
-- by:
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
-- and
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/cosmicink.lua
-- Author: Yeeloman

-- Main configuration for setting up lualine.nvim statusline plugin

-- Default Theme Colors: Define a set of base colors for your theme
local colors = {
	BG = "#202328", -- Dark background
	FG = "#bbc2cf", -- Light foreground for contrast
	YELLOW = "#e8b75f", -- Vibrant yellow
	CYAN = "#00bcd4", -- Soft cyan
	DARKBLUE = "#2b3e95", -- Deep blue
	GREEN = "#8ec07c", -- Bright green
	ORANGE = "#ff7733", -- Warm orange
	VIOLET = "#7a3ba8", -- Strong violet
	MAGENTA = "#d360aa", -- Deep magenta
	BLUE = "#4f9cff", -- Light-medium blue
	RED = "#ff3344", -- Strong red
}

local conditions = {
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
}

-- Function to get the color associated with the current mode in Vim
local function get_mode_color()
	-- Define a table mapping modes to their associated colors
	local mode_color = {
		n = colors.DARKBLUE,
		i = colors.VIOLET,
		v = colors.BLUE,
		[""] = colors.RED,
		V = colors.BLUE,
		c = colors.MAGENTA,
		no = colors.RED,
		s = colors.ORANGE,
		S = colors.ORANGE,
		[""] = colors.ORANGE,
		ic = colors.YELLOW,
		R = colors.ORANGE,
		Rv = colors.ORANGE,
		cv = colors.RED,
		ce = colors.RED,
		r = colors.CYAN,
		rm = colors.CYAN,
		["r?"] = colors.CYAN,
		["!"] = colors.RED,
		t = colors.RED,
	}
	-- Return the opposite color, or fallback to foreground color
	return mode_color[vim.fn.mode()]
end

-- -- Function to get the current mode indicator as a single character
local function mode()
	-- Map of modes to their respective shorthand indicators
	local mode_map = {
		n = "N", -- Normal mode
		i = "I", -- Insert mode
		v = "V", -- Visual mode
		[""] = "V", -- Visual block mode
		V = "V", -- Visual line mode
		c = "C", -- Command-line mode
		no = "N", -- NInsert mode
		s = "S", -- Select mode
		S = "S", -- Select line mode
		ic = "I", -- Insert mode (completion)
		R = "R", -- Replace mode
		Rv = "R", -- Virtual Replace mode
		cv = "C", -- Command-line mode
		ce = "C", -- Ex mode
		r = "R", -- Prompt mode
		rm = "M", -- More mode
		["r?"] = "?", -- Confirm mode
		["!"] = "!", -- Shell mode
		t = "T", -- Terminal mode
	}
	-- Return the mode shorthand or [UNKNOWN] if no match
	return mode_map[vim.fn.mode()] or "[UNKNOWN]"
end

-- Function to get the opposite color of a given mode color
local function get_opposite_color(mode_color)
	-- Define a table mapping colors to their opposite color
	local opposite_colors = {
		[colors.RED] = colors.CYAN,
		[colors.BLUE] = colors.ORANGE,
		[colors.GREEN] = colors.MAGENTA,
		[colors.MAGENTA] = colors.DARKBLUE,
		[colors.ORANGE] = colors.BLUE,
		[colors.CYAN] = colors.YELLOW,
		[colors.VIOLET] = colors.GREEN,
		[colors.YELLOW] = colors.RED,
		[colors.DARKBLUE] = colors.VIOLET,
	}
	-- Return the opposite color, or fallback to foreground color
	return opposite_colors[mode_color] or colors.FG
end

-- Function to create a separator component based on side (left/right) and optional mode color
local function create_separator(side, use_mode_color)
	return {
		function()
			return side == "left" and "" or "" -- Choose separator symbol based on side
		end,
		color = function()
			-- Set color based on mode or opposite color
			local color = use_mode_color and get_mode_color() or get_opposite_color(get_mode_color())
			return {
				fg = color,
			}
		end,
		padding = {
			left = 0,
		},
	}
end

-- Function to create a mode-based component (e.g., statusline)
-- with optional content, icon, and colors
local function create_mode_based_component(content, icon, color_fg, color_bg)
	return {
		content,
		icon = icon,
		color = function()
			local mode_color = get_mode_color()
			local opposite_color = get_opposite_color(mode_color)
			return {
				fg = color_fg or colors.FG,
				bg = color_bg or opposite_color,
				gui = "bold",
			}
		end,
	}
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = colors.FG, bg = colors.BG } },
				inactive = { c = { fg = colors.FG, bg = colors.BG } },
			},
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_y = {},
			lualine_x = {},
			lualine_z = {},
		},
	},

	config = function(_, opts)
		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(opts.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(opts.sections.lualine_x, component)
		end

		ins_left({
			mode,
			color = function()
				local mode_color = get_mode_color()
				return {
					fg = colors.BG,
					bg = mode_color,
					gui = "bold",
				}
			end,
			padding = { left = 1, right = 1 },
		})
		ins_left(create_separator("left", true))

		ins_left({
			function()
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			end,
			icon = " ",
			color = function()
				local virtual_env = vim.env.VIRTUAL_ENV
				if virtual_env then
					return {
						fg = get_mode_color(),
						gui = "bold,strikethrough",
					}
				else
					return {
						fg = get_mode_color(),
						gui = "bold",
					}
				end
			end,
		})

		ins_left(create_separator("right", true))

		ins_left({
			"filename",
			color = function()
				local mode_color = get_mode_color()
				return {
					fg = colors.BG,
					bg = mode_color,
					gui = "bold",
				}
			end,
		})

		ins_left(create_separator("left", true))

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				error = { fg = colors.RED },
				warn = { fg = colors.YELLOW },
				info = { fg = colors.CYAN },
			},
		})

		-- Insert mid section. You can make any number of sections in neovim :)
		-- for lualine it's any number greater then 2
		ins_left({
			function()
				return "%="
			end,
		})

		ins_left({
			function()
				local reg = vim.fn.reg_recording()
				return reg ~= "" and "[" .. reg .. "]" or ""
			end,
			color = {
				fg = colors.RED,
				gui = "bold",
			},
			cond = function()
				return vim.fn.reg_recording() ~= ""
			end,
		})

		ins_right({
			"diff",
			-- Is it me or the symbol for modified us really weird
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
			diff_color = {
				added = { fg = colors.GREEN },
				modified = { fg = colors.ORANGE },
				removed = { fg = colors.RED },
			},
			cond = conditions.hide_in_width,
		})

		ins_right(create_separator("right"))

		ins_right(create_mode_based_component("location", nil, colors.BG))

		ins_right(create_separator("left"))

		ins_right({
			"branch",
			icon = "",
			color = function()
				local mode_color = get_opposite_color(get_mode_color())
				return {
					fg = mode_color,
					gui = "bold",
				}
			end,
		})

		ins_right(create_separator("right"))

		ins_right(create_mode_based_component("progress", nil, colors.BG))

		-- IMPORTANT: actually start lualine with the built optsts
		require("lualine").setup(opts)
	end,
}
