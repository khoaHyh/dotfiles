return {
	"stevearc/conform.nvim",
	config = function()
		local status_ok, conform = pcall(require, "conform")
		if not status_ok then
			return
		end

		conform.setup({

			formatters_by_ft = {
				typescript = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				go = { "gofumpt" },
				c = { "clang-format" },
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "ruff" },
				-- Use a sub-list to run only the first available formatter
			},
			ft_parsers = {
				javascript = "babel",
				javascriptreact = "babel",
				typescript = "typescript",
				typescriptreact = "typescript",
				css = "css",
				html = "html",
				json = "json",
				yaml = "yaml",
				markdown = "markdown",
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
