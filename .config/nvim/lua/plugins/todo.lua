return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			PERF = { color = "default" },
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#E67E80" },
			warning = { "DiagnosticWarn", "WarningMsg", "#DBBC7F" },
			info = { "DiagnosticInfo", "#7FBBB3" },
			hint = { "DiagnosticHint", "#A7C080" },
			default = { "DiagnosticDefault", "#D699B6" },
			test = { "DiagnosticTest", "#E69875" },
		},
	},
}
