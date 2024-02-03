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
          comment = { italic = true },
          keyword = { italic = false }, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
      })
    end,
  },
}
