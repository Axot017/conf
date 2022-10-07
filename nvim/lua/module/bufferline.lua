local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  vim.notify("bufferline not installed")
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    indicator = {
      style = 'icon',
      icon = '|',
    },
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count)
      return "(" .. count .. ")"
    end,
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    separator_style = "slant",
    always_show_bufferline = true,
  }
}
