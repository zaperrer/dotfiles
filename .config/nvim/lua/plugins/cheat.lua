return {
	"siawkz/nvim-cheatsh",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		keys = {
			{ "<leader>ch", mode = { "n" }, ":Cheat", desc = "Cheat Sheet" },
			{ "<leader>cl", mode = { "n" }, ":CheatList", desc = "Cheat Sheet List" },
			{ "<leader>cq", mode = { "n" }, ":Cheat", desc = "Close Cheat Sheet" },
		},
	},
}
