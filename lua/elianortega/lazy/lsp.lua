return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        -- "rust_analyzer",
        -- "gopls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        -- Lua language server config
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- dart LSP
    local dartExcludedFolders = {
      vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
      vim.fn.expand("$HOME/.pub-cache"),
      vim.fn.expand("/opt/homebrew/"),
      vim.fn.expand("$HOME/tools/flutter/"),
    }

    local lsp_config = require("lspconfig")
    -- lsp_config.dcmls.setup({
    --   capabilities = capabilities,
    --   cmd = {
    --     "dcm",
    --     "start-server",
    --   },
    --   filetypes = { "dart", "yaml" },
    --   settings = {
    --     dart = {
    --       analysisExcludedFolders = dartExcludedFolders,
    --     },
    --   },
    -- })

    -- lsp_config.dartls.setup({
    --   capabilities = capabilities,
    --   cmd = {
    --     "dart",
    --     "language-server",
    --     "--protocol=lsp",
    --     -- "--port=8123",
    --     -- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
    --   },
    --   filetypes = { "dart" },
    --   init_options = {
    --     onlyAnalyzeProjectsWithOpenFiles = false,
    --     suggestFromUnimportedLibraries = true,
    --     closingLabels = true,
    --     outline = false,
    --     flutterOutline = false,
    --   },
    --   settings = {
    --     dart = {
    --       analysisExcludedFolders = dartExcludedFolders,
    --       updateImportsOnRename = true,
    --       completeFunctionCalls = true,
    --       showTodos = true,
    --     },
    --   },
    -- })


    -- LSP configuration
    local augroup = vim.api.nvim_create_augroup
    local ElianOrtegaGroup = augroup('ElianOrtega', {})

    local autocmd = vim.api.nvim_create_autocmd
    local yank_group = augroup('HighlightYank', {})

    autocmd('TextYankPost', {
      group = yank_group,
      pattern = '*',
      callback = function()
        vim.highlight.on_yank({
          higroup = 'IncSearch',
          timeout = 40,
        })
      end,
    })

    autocmd({ "BufWritePre" }, {
      group = ElianOrtegaGroup,
      pattern = "*",
      command = [[%s/\s\+$//e]],
    })


    autocmd('LspAttach', {
      group = ElianOrtegaGroup,
      callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setqflist() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      end
    })
  end
}
