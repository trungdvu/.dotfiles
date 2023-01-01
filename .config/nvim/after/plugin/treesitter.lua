-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'go',
    'lua',
    'vim',
    'rust',
    'typescript',
    'javascript',
    'tsx',
    'json',
    'css',
    'html',
    'yaml',
    'help'
  },

  sync_install = false,

  auto_install = true,

  autotag = { enable = true },

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true, disable = { 'python' } },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = '<C-s>',
      node_decremental = '<C-backspace>',
    },
  },
}

require('template-string').setup({
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
  jsx_brackets = true,
  remove_template_string = false,
  restore_quotes = {
    normal = [[']],
    jsx = [["]],
  },
})
