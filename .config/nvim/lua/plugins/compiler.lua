require("which-key").add({
	{ "<leader>r", group = "run", icon = "🏃" },
	{ "<leader>rc", "CompilerOpen", desc = "Compile the current file" },
	{ "<leader>rr", "CompilerRedo", desc = "Redo the last compile" },
	{ "<leader>rt", "CompilerToggleResults", desc = "Toggle the compile results" },
})
return {
	"Zeioth/compiler.nvim",
	cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
	opts = {},
}
