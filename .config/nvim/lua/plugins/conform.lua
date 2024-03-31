return {
	"stevearc/conform.nvim",
	config = function()
		local status_ok, conform = pcall(require, "conform")
		if not status_ok then
			return
		end

		conform.setup({
			formatters_by_ft = {
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				tsx = { { "prettierd", "prettier" } },
				jsx = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				go = { "gofumpt" },
				c = { "clang-format" },
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
