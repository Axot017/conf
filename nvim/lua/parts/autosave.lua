local autosave_ok, autosave = pcall(require, "autosave")

if not autosave_ok then
  vim.notify("autosave not insalled")
  return
end

autosave.setup(
  {
    enabled = true,
    execution_message = "File saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = { "InsertLeave", "TextChanged" },
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
  }
)
