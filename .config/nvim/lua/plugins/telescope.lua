local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- change a keymap
    { "<leader>*", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },
    -- add a keymap to browse plugin files
    {
      "<leader>*",
      function()
        local word = vim.fn.expand("<cword>")
        vim.fn.setreg("/", word)
        require("telescope.builtin").grep_string({ search = word }) end,
      desc = "Grep string",
    },
  },
  -- change some options
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    mappings = {
      i = {
        ['<CR>'] = select_one_or_multi,
      }
    },
    },
  },
}
  