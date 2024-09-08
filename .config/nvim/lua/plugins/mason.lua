return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			-- Vim Checkers:
			"vint",
			-- Python Checkers:
			"pyright",
			"ruff",
		},
	},
}
