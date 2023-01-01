local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'sumneko_lua',
  'rust_analyzer',
  'tailwindcss',
  'eslint',
})

local lspkind = require('lspkind')
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})


lsp.set_preferences({
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  },
})


local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", 'gd', require('telescope.builtin').lsp_definitions, opts)
  vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

  -- format on save
  enable_format_on_save(_, bufnr)
end)

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.configure('tsserver', {
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx"
  },
  init_options = {
    preferences = {
      jsxAttributeCompletionStylr = 'none'
    }
  },
})

lsp.setup()
