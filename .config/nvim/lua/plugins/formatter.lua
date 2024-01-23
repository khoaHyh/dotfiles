return {
	"mhartington/formatter.nvim",
	config = function()
		local status_ok, formatter = pcall(require, "formatter")
		if not status_ok then
			return
		end

		local function use_prettierd()
			return {
				exe = "prettierd",
			}
		end

		formatter.setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					function()
						return {
							exe = "stylua",
						}
					end,
				},

				go = {
					function()
						return {
							exe = "gofumpt",
						}
					end,
				},

				c = {
					function()
						return {
							exe = "clang-format",
						}
					end,
				},

				ts = {
					use_prettierd(),
				},
				md = {
					use_prettierd(),
				},
				json = {
					use_prettierd(),
				},
				css = {
					use_prettierd(),
				},
				tsx = {
					use_prettierd(),
				},
				jsx = {
					use_prettierd(),
				},
				yaml = {
					use_prettierd(),
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
