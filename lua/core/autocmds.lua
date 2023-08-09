local function augroup(name)
    return vim.api.nvim_create_augroup("vimrc_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Do not auto comment new line",
    group = augroup("disable_auto_comment"),
    command = [[set formatoptions-=cro]],
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    desc = "Check if we need to reload the file when it changed",
    command = "checktime",
    group = augroup("checktime"),
})




vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight on yank",
    callback = function()
        vim.highlight.on_yank({ higrou = "IncSearch", timeout = 400 })
    end,
    group = augroup("highlight_yank"),
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Create directories when needed, when saving a file",
    command = [[call mkdir(expand('<afile>:p:h'), 'p')]],
    group = augroup("auto_create_dir"),
})



vim.api.nvim_create_autocmd({ "FileType" }, {
    desc = "Close some filetypes with <q>",
    pattern = {
        "PlenaryTestPopup",
        "TelescopePrompt",
        "chatgpt",
        "checkhealth",
        "dap-repl",
        "help",
        "lspinfo",
        "man",
        "neotest-output",
        "neotest-output-panel",
        "neotest-summary",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close!<cr>", { buffer = event.buf, silent = true })
    end,
    group = augroup("close_with_q"),
})
