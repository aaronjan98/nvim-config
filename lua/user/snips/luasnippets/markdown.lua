local ls = require("luasnip") --{{{
local s, i, t = ls.s, ls.i, ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local events = require("luasnip.util.events")

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Markdown Snippets", { clear = true })
local file_pattern = "*.md"

return {
	s(
		"curtime",
		f(function()
			return os.date("%D - %H:%M")
		end)
	),
}
