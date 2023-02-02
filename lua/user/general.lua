vim.keymap.set('n', ',w', '<cmd>:w<cr>')
vim.keymap.set('n', ',q', '<cmd>:q<cr>')

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.backup = false
vim.o.swapfile = false
vim.o.laststatus = 0

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 300,
            on_visual = true,
        })
    end,
})
