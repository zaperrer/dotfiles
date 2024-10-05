require("which-key").add({
	{ "<leader>d", group = "duck", icon = "🦆" },
	{
		"<leader>dd",
		mode = { "n" },
		function()
			require("duck").hatch("🦆", 1)
		end,
		desc = "Hatch Duck",
		icon = "🐣",
	},
	{
		"<leader>dk",
		mode = { "n" },
		function()
			require("duck").cook()
		end,
		desc = "Cook Duck",
		icon = "🍳",
	},
	{
		"<leader>da",
		mode = { "n" },
		function()
			require("duck").cook_all()
		end,
		desc = "Cook All Ducks",
		icon = "🍳",
	},
	{
		"<leader>dc",
		mode = { "n" },
		function()
			require("duck").hatch("🐈", 0.75)
		end,
		desc = "Quite a mellow cat",
		icon = "🐈",
	},
})
return {
	"tamton-aquib/duck.nvim",
}
