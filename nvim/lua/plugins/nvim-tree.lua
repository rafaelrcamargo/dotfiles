local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end
local tree_cb = require("nvim-tree.config").nvim_tree_callback

-- Set alias for vim.g.
local g = vim.g

local nvimtree_config = {
    open_on_tab = false,
    update_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    diagnostics = {
        enable = true
    },
    git = {
        enable = false,
        ignore = true,
        timeout = 500
    },
    filters = {
        custom = {".git", "node_modules", ".cache", "__pycache__"}
    },
    renderer = {
        highlight_git = true,
        add_trailing = false,
        highlight_opened_files = "> ",
        indent_markers = {
            enable = true
        }
    },
    view = {
        width = math.floor(vim.fn.winwidth(0) * 0.25), -- Finding 25% of windows width.
        side = "left",
        preserve_window_proportions = false,
        mappings = {
            list = {{
                key = "<S-h>",
                cb = ":call ResizeLeft(3)<CR>"
            }, {
                key = "<C-h>",
                cb = tree_cb("toggle_dotfiles")
            }}
        }
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false
        },
        open_file = {
            quit_on_open = true,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "Outline", "toggleterm",
                                "alpha"},
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        }
    }
}

local config = require("user_settings")
if config.nvim_tree then
    for k, v in pairs(config.nvim_tree) do
        nvimtree_config[k] = v
    end
end

nvimtree.setup(nvimtree_config)
