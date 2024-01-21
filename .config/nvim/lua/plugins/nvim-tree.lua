return {
    "kyazdani42/nvim-tree.lua",
    config = function () 
        local status_ok, nvim_tree = pcall(require, 'nvim-tree')
        if not status_ok then
            return
        end

        nvim_tree.setup({
            disable_netrw = true,
            hijack_netrw = true,
            open_on_tab = false,
            hijack_cursor = false,
            update_cwd = true,
            diagnostics = {
                enable = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
                ignore_list = {},
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 500,
            },
            view = {
                width = 30,
                side = "left",
                number = false,
                relativenumber = false,
            }
        })
    end
}
