return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			vim.list_extend(opts.routes, {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "Starting Supermaven" },
							{ find = "Supermaven Free Tier" },
						},
					},
					skip = true,
				},
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					skip = true,
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "fade_in_slide_out",
		},
	},
}
