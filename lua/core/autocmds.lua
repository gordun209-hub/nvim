-- only highlight when searching
vim.api.nvim_create_autocmd("CmdlineEnter", {
   callback = function()
      local cmd = vim.v.event.cmdtype
      if cmd == "/" or cmd == "?" then
         vim.opt.hlsearch = true
      end
   end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
   callback = function()
      local cmd = vim.v.event.cmdtype
      if cmd == "/" or cmd == "?" then
         vim.opt.hlsearch = false
      end
   end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank({ timeout = 200 })
   end,
})

-- Disable auto comment
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.opt.formatoptions = { c = false, r = false, o = false }
   end,
})

-- turn on spell check for markdown and text file
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = { "*.md" },
   callback = function()
      vim.opt_local.spell = true
   end,
})

