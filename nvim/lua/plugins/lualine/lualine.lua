local present, lualine_setup = pcall(require, "lualine")
if not present then
    return
end

local utils = require("plugins.lualine.components")

require("../user_settings")
local lualine_style = 1
if user_lualine_style then
    if type(user_lualine_style) == "number" then
        lualine_style = user_lualine_style
    elseif type(user_lualine_style) == "table" then
        lualine_style = {user_lualine_style[1], user_lualine_style[2]}
    end
end

local lualine_styles = {{{
    left = "",
    right = ""
}, {
    left = "│",
    right = "│"
}}, {{
    left = " ",
    right = " "
}, {
    left = " ",
    right = " "
}}, {{
    left = " ",
    right = " "
}, {
    left = "|",
    right = "|"
}}, {{
    left = "",
    right = ""
}, {
    left = "",
    right = ""
}}, {{
    left = "",
    right = ""
}, {
    left = "",
    right = ""
}}}

local section_char, component_char
if user_lualine_style then
    if type(user_lualine_style) == "number" then
        section_char = lualine_styles[lualine_style][1]
        component_char = lualine_styles[lualine_style][2]
    elseif type(user_lualine_style) == "table" then
        section_char = user_lualine_style[1]
        component_char = user_lualine_style[2]
    end
else
    section_char = lualine_styles[lualine_style][1]
    component_char = lualine_styles[lualine_style][2]
end

local lualine_config = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        disabled_filetypes = {"TelescopePrompt", "TelescopeResults", "aerial", "dapui_scopes", "dapui_breakpoints",
                              "dapui_stacks", "dapui_watches", "dap-repl"},
        section_separators = section_char,
        component_separators = component_char,
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

local config = require("user_settings")
if config.lualine then
    for k, v in pairs(config.lualine) do
        lualine_config[k] = v
    end
end

lualine_setup.setup(lualine_config)
