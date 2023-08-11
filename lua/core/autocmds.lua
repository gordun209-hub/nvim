local function augroup(name)
  return vim.api.nvim_create_augroup('vimrc_' .. name, { clear = true })
end
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Do not auto comment new line',
  group = augroup('disable_auto_comment'),
  command = [[set formatoptions-=cro]],
})
vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Close some filetypes with <q>',
  pattern = {
    'PlenaryTestPopup',
    'TelescopePrompt',
    'chatgpt',
    'checkhealth',
    'dap-repl',
    'help',
    'lspinfo',
    'man',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close!<cr>', { buffer = event.buf, silent = true })
  end,
  group = augroup('close_with_q'),
})
