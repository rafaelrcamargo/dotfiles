local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local treesitter_config = {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
            local max_filesize = 500 * 1024 -- 500Kb
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end
    },
    matchup = {
        enable = true
    },
    indent = {
        enable = true,
        disable = {"python"}
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    }
}

local config = require("user_settings")
if config.treesitter then
    for k, v in pairs(config.treesitter) do
        treesitter_config[k] = v
    end
end

nvim_treesitter.setup(treesitter_config)
