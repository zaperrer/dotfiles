require("which-key").add({
	{ "<leader>fu", mode = { "n" }, ":CellularAutomaton make_it_rain<CR>", desc = "Rain", icon = "" },
})
return {
	"eandrju/cellular-automaton.nvim",
}
