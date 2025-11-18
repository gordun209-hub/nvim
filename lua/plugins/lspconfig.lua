return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        -- add c language server
        require("lspconfig").clangd.setup{}
    end,
}
