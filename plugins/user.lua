return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- "loctvl842/monokai-pro.nvim",
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum",
        styles = {
          comment = { italic = false },
          keyword = { italic = false }, -- any other keyword
          type = { italic = false }, -- (preferred) int, long, char, etc
          storageclass = { italic = false }, -- static, register, volatile, etc
          structure = { italic = false }, -- struct, union, enum, etc
          parameter = { italic = false }, -- parameter pass in function
          annotation = { italic = false },
          tag_attribute = { italic = false }, -- attribute of tag in reactjs
        },
      })
    end,
  },
}
