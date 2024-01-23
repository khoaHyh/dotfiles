return {
	"mfussenegger/nvim-lint",
	config = function()
		local status_ok, linter = pcall(require, "lint")
		if not status_ok then
			return
		end

		linter.linters_by_ft = {
			markdown = { "vale" },
			c = { "cpplint" },
			go = { "golangci-lint" },
			ts = { "eslint_d" },
			js = { "eslint_d" },
			lua = { "luacheck" },
		}
	end,
}
