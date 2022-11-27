-- Hide ~ from end of lines.
vim.opt.fillchars = {
    eob = " "
}

local highlight = require("utils").highlight

-- -- Highlightign line number for lsp diagnostics sings based on colorscheme
vim.api.nvim_create_autocmd({"ColorScheme", "VimEnter"}, {
    pattern = "*",

    callback = function()
        local fn = vim.fn

        -- Getting diagnostic signs color.
        local error_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignError")), "fg")
        local info_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignInfo")), "fg")
        local warn_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignWarn")), "fg")
        local hint_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignHint")), "fg")

        local error_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignError")), "bg")
        local info_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignInfo")), "bg")
        local warn_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignWarn")), "bg")
        local hint_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignHint")), "bg")

        -- Applying thoes colors to diagnostic line number.
        highlight("DiagnosticLineNrError", {
            bg = error_bcolor,
            fg = error_fcolor
        }, {
            bold = true
        })
        highlight("DiagnosticLineNrWarn", {
            bg = warn_bcolor,
            fg = warn_fcolor
        }, {
            bold = true
        })
        highlight("DiagnosticLineNrInfo", {
            bg = info_bcolor,
            fg = info_fcolor
        }, {
            bold = true
        })
        highlight("DiagnosticLineNrHint", {
            bg = hint_bcolor,
            fg = hint_fcolor
        }, {
            bold = true
        })

        -- Applying diagnostic line number and remove diagnostic signs
        fn.sign_define("DiagnosticSignError", {
            text = "",
            texthl = "",
            numhl = "DiagnosticLineNrError"
        })
        fn.sign_define("DiagnosticSignWarn", {
            text = "",
            texthl = "",
            numhl = "DiagnosticLineNrWarn"
        })
        fn.sign_define("DiagnosticSignInfo", {
            text = "",
            texthl = "",
            numhl = "DiagnosticLineNrInfo"
        })
        fn.sign_define("DiagnosticSignHint", {
            text = "",
            texthl = "",
            numhl = "DiagnosticLineNrHint"
        })
    end
})

vim.g.tokyonight_style = "night" -- styles: storm, night and day.
vim.g.enfocado_style = "nature" -- styles: nature and neon.

-- In enfocado colorscheme you can enable highlight some plugins.
-- You can set enabled plugins like this(This is CodeArt supported plugins).
vim.g.enfocado_plugins = {"cmp", "alpha", "gitsigns", "lsp", "lsp-installer", "matchup", "packer", "scrollview",
                          "telescope", "todo-comments", "tree", "treesitter", "which-key"}

-- Removing background and/or foreground from some highlight groups
function _G.make_codeart_transparent()
    highlight("Normal", {
        bg = "none",
        fg = "none"
    })
    highlight("NormalNc", {
        bg = "none",
        fg = "none"
    })
    highlight("LineNr", {
        bg = "none",
        fg = "none"
    })
    highlight("CursorLineNr", {
        bg = "none",
        fg = "none"
    })
    highlight("SignColumn", {
        bg = "none",
        fg = "none"
    })
    highlight("EndOfBuffer", {
        bg = "none",
        fg = "none"
    })
    highlight("NormalFloat", {
        bg = "none"
    })
    highlight("Float", {
        bg = "none"
    })

    highlight("AlphaCenter", {
        bg = "none",
        fg = "none"
    })
    highlight("AlphaFooter", {
        bg = "none",
        fg = "none"
    })

    highlight("NvimTreeNormal", {
        bg = "none",
        fg = "none"
    })
    highlight("NvimTreeNormalNc", {
        bg = "none",
        fg = "none"
    })
    highlight("NvimTreeEndOfBuffer", {
        bg = "none",
        fg = "none"
    })
    highlight("NvimTreeFolderIcon", {
        bg = "none",
        fg = "none"
    })
    highlight("NvimTreeOpenedFolderName", {
        bg = "none",
        fg = "none"
    })

    highlight("BufferLineFill", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineDiagnostics", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineTab", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineTabSelected", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineTabClose", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineDuplicate", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineDuplicateSelected", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineDuplicateVisible", {
        bg = "none",
        fg = "none"
    })

    highlight("BufferLineBackground", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineCloseButton", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineCloseButtonSelected", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineCloseButtonVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineBufferVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineSeperator", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineSeperatorVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineGroupSeperator", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineSeparator", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineBufferSelected", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineDiagnostic", {
        bg = "none",
        fg = "none"
    })

    highlight("BufferLinePick", {
        bg = "none"
    })
    highlight("BufferLinePickSelected", {
        bg = "none"
    })
    highlight("BufferLineSeparatorSelected", {
        bg = "none"
    })
    highlight("BufferLineIndicatorSelected", {
        bg = "none"
    })
    highlight("BufferLineDevIconLuaSelected", {
        bg = "none"
    })
    highlight("BufferLineDevIconDefaultInactive", {
        bg = "none"
    })

    highlight("BufferLineError", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineErrorDiagnostic", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineErrorVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineErrorDiagnosticVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineErrorSelected", {
        bg = "none"
    })
    highlight("BufferLineErrorDiagnosticSelected", {
        bg = "none"
    })
    highlight("BufferLineErrorDiagnosticSelected", {
        bg = "none"
    })

    highlight("BufferLineWarning", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineWarningVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineWarningDiagnosticVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineWarningDiagnostic", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineWarningSelected", {
        bg = "none"
    })
    highlight("BufferLineWarningDiagnosticSelected", {
        bg = "none"
    })
    highlight("BufferLineWarningDiagnosticSelected", {
        bg = "none"
    })

    highlight("BufferLineInfo", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineInfoVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineInfoDiagnosticVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineInfoDiagnostic", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineInfoSelected", {
        bg = "none"
    })
    highlight("BufferLineInfoDiagnosticSelected", {
        bg = "none"
    })
    highlight("BufferLineInfoDiagnosticSelected", {
        bg = "none"
    })

    highlight("BufferLineModifiedVisible", {
        bg = "none",
        fg = "none"
    })
    highlight("BufferLineModified", {
        bg = "none"
    })
    highlight("BufferLineModifiedSelected", {
        bg = "none"
    })

    highlight("WhichKeyFloat", {
        bg = "none"
    })
    highlight("WhichKey", {
        bg = "none"
    })
end
