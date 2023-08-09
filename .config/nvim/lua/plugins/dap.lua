local status_ok, dapui = pcall(require, "dapui")

if not status_ok then
	vim.notify("dapui not installed")
	return
end

local ok, dap = pcall(require, "dap")

if not ok then
	vim.notify("dap not installed")
	return
end

local M = {}

M.config = {
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.6 },
				{ id = "breakpoints", size = 0.2 },
				{ id = "stacks", size = 0.1 },
				{ id = "watches", size = 0.1 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
			},
			size = 0.25,
			position = "bottom",
		},
	},
}

dapui.setup(M.config)

require("dap.ext.vscode").load_launchjs()

dap.adapters.go = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}
dap.listeners.after.event_initialized["dapui_config"] = function()
	dap.set_exception_breakpoints({})
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

return M
