-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("elixir").setup()

vim.keymap.set("n", "gn", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "gN", ":BufferLineCyclePrev<CR>")
-- vim.keymap.set("n", "gd", ":bdelete<CR>")


vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        style_preset = require("bufferline").style_preset.minimal,
        indicator = {
            style = 'underline',
        },
        separator_style = "slope",
        sort_by = "insert_after_current",
    },
}

vim.opt.clipboard = ""

vim.opt.relativenumber = false
