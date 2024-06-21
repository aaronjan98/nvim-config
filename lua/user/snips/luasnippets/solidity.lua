local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Solidity Snippets", { clear = true })
local file_pattern = "*.sol"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- [[ Start Refactoring ]] --

-- Hardhat
local log = s(
	"console.log",
	fmt(
		[[
console.log({})
]],
		{
			i(0, ""),
		}
	)
)
table.insert(snippets, log)

-- imports
local hardhat_console = s("hardhat/console", { t('import "hardhat/console.sol";') })
table.insert(snippets, hardhat_console)

-- Contract
local contract = s(
	"contract",
	fmt(
		[[
contract {} {{
    {}
}}
]],
		{
			i(1, "contractName"),
			-- c(2, { t("--TODO: "), t("") }),
			i(2),
		}
	)
)
table.insert(snippets, contract)

local license = s("license", { t("// SPDX-License-Identifier: Unlicense") })
table.insert(snippets, license)

local pragma = s("pragma", { t("pragma solidity "), i(1, "^0.8.9;") })
table.insert(snippets, pragma)

local mapping = s(
	"mapping",
	fmt(
		[[
mapping({} => {}) public {};
]],
		{
			i(1, "address"),
			i(2, "uint256"),
			i(3, "balanceOf"),
		}
	)
)
table.insert(snippets, mapping)

local keccak = s(
	"keccak256(abi.encodePacked())",
	fmt(
		[[
keccak256(abi.encodePacked({}))
]],
		{ i(1, "string") }
	)
)
table.insert(snippets, keccak)

-- End Refactoring --

return snippets, autosnippets
