local M = {}
local api = vim.api

-- https://zignar.net/2022/01/21/a-boring-statusline-for-neovim/#language-server-status-or-filename

function M.statusline()
	local parts = {
		[[%<» %{luaeval("require'me'.file_or_lsp_status()")} %m%r%=]],
		"%#warningmsg#",
		"%{&paste?'[paste] ':''}",
		"%*",

		"%#warningmsg#",
		"%{&ff!='unix'?'['.&ff.'] ':''}",
		"%*",

		"%#warningmsg#",
		"%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.'] ':''}",
		"%*",
		[[%{luaeval("require'me'.dap_status()")}]],
		[[%{luaeval("require'me'.diagnostic_status()")}]],
	}
	return table.concat(parts, "")
end

return M
