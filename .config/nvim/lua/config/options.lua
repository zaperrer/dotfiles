-- Tabs & Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- DB save directory
vim.g.db_ui_save_location = "~/Library/CloudStorage/Box-Box/Code/db_credentials"

-- Transparency
vim.g.transparency = 0.8

-- Neovide
if vim.g.neovide then
	-- Fonts
	vim.o.guifont = "FiraCode Nerd Font Mono:h20"
	-- Transparency
	local alpha = function()
		return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end
	vim.g.neovide_transparency = 0.0
	vim.g.neovide_background_color = "#191A21" .. alpha()
	-- Shadow
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5

	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
