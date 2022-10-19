local dap_status, dap = pcall(require, "dap")
if not dap_status then
	return
end

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "C:\\Users\\Mathijs\\AppData\\Local\\nvim-data\\mason\\bin",
		args = { "--port", "${port}" },

		-- On windows you may have to uncomment this:
		detached = false,
	},
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}
dap.configurations.cpp = dap.configurations.rust
dap.configurations.c = dap.configurations.rust

local dapui_status, dapui = pcall(require, "dapui")
if not dapui_status then
	return
end

dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end
