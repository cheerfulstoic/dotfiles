
return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options.sort_by = "insert_after_current"
      opts.options.separator_style = "slant"
      opts.options.indicator = {
          style = 'underline',
      }
    end,
  },
}
