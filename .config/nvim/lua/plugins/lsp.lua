return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
	},

	config = function()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local default_setup = function(server)
			require("lspconfig")[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		local lspconfig = require("lspconfig")
		local mason = require("mason")
		require("mason-lspconfig").setup({
			ensure_installed = { "clangd", "gopls", "tsserver", "eslint", "lua_ls", "marksman", "pyright" },
			handlers = { default_setup },
		})

		mason.setup()

		lspconfig.clangd.setup({})
		lspconfig.gopls.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.eslint.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.marksman.setup({})
		lspconfig.pyright.setup({})

		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			mapping = cmp.mapping.preset.insert({
				-- Enter key confirms completion item
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- Previous item
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
				-- Next item
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
				-- Ctrl + space triggers completion menu
				["<C-Space>"] = cmp.mapping.complete(),
			}),
		})

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				--[[ vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) ]]
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end,
		})
	end,
}
