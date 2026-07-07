local M = {}

M.config = {
    extensions = { "fasm", "inc", "asm" },
    formatting = {
        tabstop = 8,
        softtabstop = 4,
        shiftwidth = 4,
        expandtab = true,
    },
}

function M.setup(user_opts)
    M.config = vim.tbl_deep_extend("force", M.config, user_opts or {})

    local pattern_map = {}
    for _, ext in ipairs(M.config.extensions) do
        pattern_map[".*%." .. ext] = "fasm"
    end

    vim.filetype.add({
        pattern = pattern_map,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "fasm",
        callback = function()
            vim.bo.commentstring = "; %s"
            vim.opt_local.iskeyword:append(".,_,$")

            vim.bo.tabstop = M.config.formatting.tabstop
            vim.bo.softtabstop = M.config.formatting.softtabstop
            vim.bo.shiftwidth = M.config.formatting.shiftwidth
            vim.bo.expandtab = M.config.formatting.expandtab
        end,
    })
end

return M
