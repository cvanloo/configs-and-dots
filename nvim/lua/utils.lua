local M = {} -- the module to export
local cmd = vim.cmd

-- helper to create vim autogroups
function M.create_augroup(autocmds, name)
	cmd("augroup " .. name)
	cmd("autocmd!")
	for _, autocmd in ipairs(autocmds) do
		cmd("autocmd " .. table.concat(autocmd, " "))
	end
	cmd("augroup END")
end

return M -- export the module
