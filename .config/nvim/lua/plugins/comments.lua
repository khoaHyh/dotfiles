return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		local status_ok, comment = pcall(require, "Comment")
		if not status_ok then
			return
		end

		comment.setup({})
	end,
}
