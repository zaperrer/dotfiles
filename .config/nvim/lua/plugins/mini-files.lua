return {
	{
		"echasnovski/mini.files",
		opts = {
			options = {
				-- Whether to use for editing directories
				-- Disabled by default in LazyVim because neo-tree is used for that
				use_as_default_explorer = true,
			},
		},
		keys = {
			{
				"-",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (Directory of Current File)",
			},
		},
	},
}
