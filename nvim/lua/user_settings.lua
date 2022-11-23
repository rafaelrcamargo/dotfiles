local map = require("utils").map
local which_key = require("utils").wk_add

-- WARN: Do not touch this table.
extra_which_keys = {}

disable_plugins = {
    -- NOTE: These two plugins are for better performance
    -- and fixing one of neovim bugs.
    impatient = false,
    fix_cursor_hold = false,

    -- NOTE: Many plugins use this plugin as a dependency.
    -- I suggest to not remove this plugins.
    plenary = false,

    -- NOTE: These plugins are colorscheme. By default only
    -- enfocado is enabled. you can enable other by changing
    -- true to false.
    tokyonight = true,
    nightfly = true,
    moonfly = true,
    nord = true,
    onedark = true,
    nvim_enfocado = true,

    -- NOTE: These plugins are for debugging. You can install
    -- Some debug servers with dap_install but the list of those
    -- Are realy small. You can install debugger by your self and
    -- then configure it by your self so you can use nvim_dap and nvim_dap_ui
    -- without dap_install
    nvim_dap = true,
    dap_install = true,
    nvim_dap_ui = true,

    -- NOTE: these plugins are telescope and telescope extensions. fzf is for
    -- better searching experince and you can fuzzy find directories with
    -- telescope_find_directories
    telescope_fzf_native = false,
    telescope_find_directories = false,
    telescope = false,

    -- NOTE: scrollview is builtin scrollbar for CodeArt and
    -- And neoscroll is for scroll animation.
    scrollview = true,
    neoscroll = true,

    -- NOTE: nvim-cmp and luasnip are for code completion.
    nvim_cmp = false,
    luasnip = false,
    friendly_snippets = false,
    cmp_buffer = false,
    cmp_path = false,
    cmp_nvim_lsp = false,
    cmp_luasnip = false,
    cmp_nvim_lua = false,

    nvim_web_devicons = true,
    lualine = false,
    nvim_bufferline = false,
    indent_blankline = false,

    better_escape = true, -- For exiting from insert mode with jj and jk

    truezen = true,
    nvim_tree = false,
    treesitter = false,
    nvim_colorizer = false,
    alpha = false,
    nvim_lspconfig = false,
    lsp_installer = false,
    null_ls = false,
    lspsaga = false,
    symbols_outline = false,
    lsp_signature = false,
    toggleterm = false,
    fugitive = false,
    gitsigns = false,
    autopairs = false,
    nvim_ts_autotag = false,
    todo_comments = false,
    which_key = false,
    mkdir = false,
    kommentary = false,
    ts_context_commentstring = false,
    vim_matchup = false,
    vim_resize = false
}

additional_plugins = {{"sainnhe/gruvbox-material"}, {"github/copilot.vim"}}

local config = {
    -- null-ls configuration
    null_ls = function()
        -- Formatting and linting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim
        local status_ok, null_ls = pcall(require, "null-ls")
        if not status_ok then
            return
        end

        -- Check supported formatters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        local formatting = null_ls.builtins.formatting

        -- Check supported linters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            debug = false,
            sources = { -- Settings up some linters and code formatters.
            formatting.black, formatting.stylua, formatting.rustfmt, formatting.clang_format, formatting.prettier,
            formatting.taplo, formatting.shfmt.with({
                command = "shfmt",
                args = {"-i", "2", "-ci", "-bn", "$FILENAME", "-w"}
            }), diagnostics.zsh, -- diagnostics.luacheck,
            diagnostics.pylint},
            -- This function is for format on save.
            on_attach = function(client)
                if client.server_capabilities.document_formatting then
                    vim.cmd([[
                  augroup LspFormatting
                      autocmd! * <buffer>
                      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                  augroup END
                  ]])
                end
            end
        })
    end,
    treesitter = {
        highlight = {
            enable = true
        }
    },
    other_configs = function()
        vim.cmd("colorscheme gruvbox-material")

        vim.cmd([[
          set breakindent
          set breakindentopt=shift:2,min:40,sbr
        ]])

        -- Neovide config
        vim.cmd([[
          nnoremap <A-Down> :m .+1<CR>==
          nnoremap <A-Up> :m .-2<CR>==
          inoremap <A-Down> <Esc>:m .+1<CR>==gi
          inoremap <A-Up> <Esc>:m .-2<CR>==gi
          vnoremap <A-Down> :m '>+1<CR>gv=gv
          vnoremap <A-Up> :m '<-2<CR>gv=gv

          if exists("g:neovide")
            let g:neovide_transparency = 0.95
            let g:neovide_scroll_animation_length = 0.2
            let g:neovide_cursor_unfocused_outline_width = 0.0625
          else
            hi Normal guibg=none ctermbg=none
            hi LineNr guibg=none ctermbg=none
            hi Folded guibg=none ctermbg=none
            hi NonText guibg=none ctermbg=none
            hi SpecialKey guibg=none ctermbg=none
            hi VertSplit guibg=none ctermbg=none
            hi SignColumn guibg=none ctermbg=none
            hi EndOfBuffer guibg=none ctermbg=none
          endif
        ]])


        -- Visual
        vim.o.cmdheight = 1 -- Space for displaying messages
        vim.o.termguicolors = true -- Use true colors, required for some plugins

        -- Behavior
        vim.o.hlsearch = false -- Disable highlighting search results
        vim.o.ignorecase = true -- Ignore case when using lowercase in search
        vim.o.smartcase = true -- But don't ignore it when using upper case
        vim.o.smarttab = true -- Insert spaces when tabbing
        vim.o.smartindent = true -- Insert indents automatically
        vim.o.expandtab = true -- Convert tabs to spaces
        vim.o.tabstop = 2 -- Number of spaces tabs count for
        vim.o.softtabstop = 2 -- Number of spaces tabs count for while editing
        vim.o.shiftwidth = 2 -- Number of spaces to use for autoindent
        vim.o.splitbelow = true -- Put new windows below current
        vim.o.splitright = true -- Put new windows right of current
        vim.o.scrolloff = 12 -- Minimum offset in lines to screen borders
        vim.o.sidescrolloff = 8 -- Minimum offset in columns to screen borders
        vim.o.mouse = 'a' -- Enable mouse support

        vim.opt.cursorline = true

        -- Toggle terminal
        map("n", "<C-t>", ":ToggleTerm<CR>")

        -- Write buffer
        map("n", "<C-s>", ":w<CR>")

        -- Closes the current buffer
        map("n", "<C-w>", ":bd<CR>")
        -- Closes the current window
        map("n", "<C-S-w>", ":q<CR>")

        -- Jump lines
        map("n", "<C-Up>", ":-5<CR>")
        map("n", "<C-Down>", ":+5<CR>")

        -- Toggle NvimTree
        map("n", "<leader>tt", ":NvimTreeToggle<CR>")

        -- Telescope mappings
        map("n", "<leader>fg", ":Telescope live_grep<CR>")
        map("n", "<leader>ff", ":Telescope find_files<CR>")
        map("n", "<leader>fb", ":Telescope buffers<CR>")

        -- Splits
        map("n", "<leader>ws", ":split<CR>")
        map("n", "<leader>vs", ":vsplit<CR>")

        -- Correct the clipboard
        map("i", "<C-v>", "<C-r>+")
        map("i", "<C-c>", "<C-r>0")

        -- Repeat
        map("n", "<leader>.", "@:")

        user_lualine_style = 2 -- You can choose between predefined 1, 2, 3, 4 and 5
        -- user_lualine_style = { { left = " ", right = " " }, { left = "", right = "" } }

        user_indent_blankline_style = 1 -- You can choose between predefined 1, 2, 3, 4,5 and 6
        -- user_indent_blankline_style = ""
    end
}

return config
