local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },

  -- for tokyonight
  highlights = {
    background = {
      fg = '#9aa5ce',
      bg = '#414868'
    },
    buffer_selected = {
      fg = '#7aa2f7',
      italic = true
    },
  },
})

vim.keymap.set('n', '<C-n>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-p>', '<Cmd>BufferLineCyclePrev<CR>', {})
