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
        }
      })
    end,
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- require("metals").setup_dap()

        require("which-key").register({
          ["<leader>l"] = {
            a = { vim.lsp.buf.code_action, "LSP code action" },
            d = { vim.lsp.buf.hover, "Hover diagnostics" },
            e = {
              name = "Set diagnostic level",
              a = { vim.diagnostic.setqflist, "All diagnostics" },
              e = { vim.diagnostic.setqflist({ severity = "E" }), "All errors" },
              w = { vim.diagnostic.setqflist({ severity = "W" }), "All warnings" },
            },
            f = { vim.lsp.buf.format, "Format buffer" },
            h = { vim.lsp.buf.signature_help, "Signature help" },
            i = { require("metals").run_doctor, "LSP information" },
            I = { vim.lsp.buf.implementation, "Go to implementation" },
            l = { vim.lsp.codelens.refresh, "LSP CodeLens refresh" },
            L = { vim.lsp.codelens.run, "LSP CodeLens run" },
            R = { require("telescope.builtin").lsp_references, "Search reference under cursor" },
            r = { vim.lsp.buf.rename, "Rename symbol" },
            s = { require("telescope.builtin").lsp_document_symbols, "Search document symbols" },
            -- S = { require("telescope.builtin").lsp_dynamic_workspace_symbols, "Search workspace symbols" },
          },
        })

        -- -- all workspace diagnostics
        -- vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

        -- -- all workspace errors
        -- vim.keymap.set("n", "<leader>ae", function()
        --   vim.diagnostic.setqflist({ severity = "E" })
        -- end)

        -- -- all workspace warnings
        -- map("n", "<leader>aw", function()
        --   vim.diagnostic.setqflist({ severity = "W" })
        -- end)

        -- -- buffer diagnostics only
        -- map("n", "<leader>d", vim.diagnostic.setloclist)

        -- map("n", "[c", function()
        --   vim.diagnostic.goto_prev({ wrap = false })
        -- end)

        -- map("n", "]c", function()
        --   vim.diagnostic.goto_next({ wrap = false })
        -- end)
      end
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }
      metals_config.init_options.statusBarProvider = "off"
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
  
      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  }
}
